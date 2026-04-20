#!/bin/bash

set -euo pipefail

PROJECT_PATH="NBANow.xcodeproj"
SCHEME="NBANow"
CONFIGURATION="Debug"
DEVICE_NAME="${DEVICE_NAME:-iPhone 16}"
SCREENSHOT_PATH="${SCREENSHOT_PATH:-docs/screenshots/home.png}"
DERIVED_DATA_PATH="${DERIVED_DATA_PATH:-build/DerivedData}"
BUNDLE_ID="${BUNDLE_ID:-com.gerardjalon.nbanow}"

echo "Using device: ${DEVICE_NAME}"
mkdir -p "$(dirname "${SCREENSHOT_PATH}")"
mkdir -p "${DERIVED_DATA_PATH}"

shutdown_simulators() {
  xcrun simctl shutdown all >/dev/null 2>&1 || true
}

trap shutdown_simulators EXIT

find_device_id() {
  local requested_name="$1"
  xcrun simctl list devices available | grep "${requested_name} (" | head -n 1 | sed -E 's/.*\(([A-F0-9-]+)\).*/\1/' || true
}

DEVICE_ID="$(find_device_id "${DEVICE_NAME}")"

if [[ -z "${DEVICE_ID}" ]]; then
  echo "Requested simulator '${DEVICE_NAME}' is not available. Falling back to a detected iPhone simulator."
  DEVICE_NAME="$(xcrun simctl list devices available | grep "iPhone" | head -n 1 | sed -E 's/^[[:space:]]*([^()]*) \([A-F0-9-]+\).*/\1/' || true)"
  DEVICE_ID="$(find_device_id "${DEVICE_NAME}")"
fi

if [[ -z "${DEVICE_ID}" ]]; then
  echo "Could not find any available iPhone simulator."
  xcrun simctl list devices available
  exit 1
fi

echo "Resolved simulator: ${DEVICE_NAME} (${DEVICE_ID})"
echo "Booting simulator ${DEVICE_ID}"
xcrun simctl boot "${DEVICE_ID}" >/dev/null 2>&1 || true
xcrun simctl bootstatus "${DEVICE_ID}" -b

echo "Normalizing simulator status bar"
xcrun simctl status_bar "${DEVICE_ID}" override \
  --time "9:41" \
  --dataNetwork wifi \
  --wifiBars 3 \
  --cellularMode active \
  --cellularBars 4 \
  --batteryState charged \
  --batteryLevel 100 >/dev/null 2>&1 || true

echo "Resolving packages"
xcodebuild \
  -resolvePackageDependencies \
  -project "${PROJECT_PATH}" \
  -scheme "${SCHEME}" \
  -clonedSourcePackagesDirPath build/SourcePackages

echo "Building app for simulator"
xcodebuild \
  -project "${PROJECT_PATH}" \
  -scheme "${SCHEME}" \
  -configuration "${CONFIGURATION}" \
  -destination "id=${DEVICE_ID}" \
  -derivedDataPath "${DERIVED_DATA_PATH}" \
  build

APP_PATH="$(find "${DERIVED_DATA_PATH}/Build/Products" -maxdepth 2 -type d -name "${SCHEME}.app" | head -n 1)"

if [[ -z "${APP_PATH}" ]]; then
  echo "Could not locate built app inside ${DERIVED_DATA_PATH}."
  exit 1
fi

echo "Installing app from ${APP_PATH}"
xcrun simctl uninstall "${DEVICE_ID}" "${BUNDLE_ID}" >/dev/null 2>&1 || true
xcrun simctl install "${DEVICE_ID}" "${APP_PATH}"

capture_scene() {
  local scene_name="$1"
  local output_path="$2"
  local wait_seconds="$3"

  echo "Launching scene ${scene_name}"
  xcrun simctl terminate "${DEVICE_ID}" "${BUNDLE_ID}" >/dev/null 2>&1 || true
  xcrun simctl launch "${DEVICE_ID}" "${BUNDLE_ID}" --screenshot-mode --screenshot-scene "${scene_name}" >/dev/null
  sleep "${wait_seconds}"

  echo "Capturing screenshot to ${output_path}"
  xcrun simctl io "${DEVICE_ID}" screenshot "${output_path}"
}

capture_scene "home" "docs/screenshots/home.png" 18
capture_scene "calendar" "docs/screenshots/calendar.png" 16
capture_scene "profile" "docs/screenshots/profile.png" 16
capture_scene "teamInfo" "docs/screenshots/team-info.png" 18
capture_scene "addTeam" "docs/screenshots/add-team.png" 16

echo "Screenshots created in docs/screenshots/"
