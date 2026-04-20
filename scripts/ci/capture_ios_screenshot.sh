#!/bin/bash

set -euo pipefail

PROJECT_PATH="NBANow.xcodeproj"
SCHEME="NBANow"
CONFIGURATION="Debug"
DEVICE_NAME="${DEVICE_NAME:-iPhone 15}"
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

DEVICE_ID="$(xcrun simctl list devices available | grep "${DEVICE_NAME} (" | head -n 1 | sed -E 's/.*\(([A-F0-9-]+)\) \(Shutdown\).*/\1/' || true)"

if [[ -z "${DEVICE_ID}" ]]; then
  DEVICE_ID="$(xcrun simctl list devices available | grep "${DEVICE_NAME} (" | head -n 1 | sed -E 's/.*\(([A-F0-9-]+)\).*/\1/' || true)"
fi

if [[ -z "${DEVICE_ID}" ]]; then
  echo "Could not find an available simulator named ${DEVICE_NAME}."
  xcrun simctl list devices available
  exit 1
fi

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

echo "Launching app"
xcrun simctl launch "${DEVICE_ID}" "${BUNDLE_ID}" || true

sleep 20

echo "Capturing screenshot to ${SCREENSHOT_PATH}"
xcrun simctl io "${DEVICE_ID}" screenshot "${SCREENSHOT_PATH}"

echo "Screenshot created at ${SCREENSHOT_PATH}"
