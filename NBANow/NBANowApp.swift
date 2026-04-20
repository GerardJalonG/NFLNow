import SwiftUI

@main
struct NBANowApp: App {
    @StateObject private var storePlayers: PlayerStore
    @StateObject private var teamStore: TeamStore
    private let screenshotMode: Bool
    private let screenshotScene: ScreenshotScene

    init() {
        let isScreenshotMode = ScreenshotConfiguration.isEnabled
        screenshotMode = isScreenshotMode
        screenshotScene = ScreenshotConfiguration.scene

        if isScreenshotMode {
            _storePlayers = StateObject(
                wrappedValue: PlayerStore(
                    seededPlayers: ScreenshotDemoData.favoritePlayers,
                    usesPersistentStorage: false
                )
            )
            _teamStore = StateObject(
                wrappedValue: TeamStore(
                    seededTeamIDs: ScreenshotDemoData.favoriteTeams,
                    usesPersistentStorage: false
                )
            )
        } else {
            _storePlayers = StateObject(wrappedValue: PlayerStore())
            _teamStore = StateObject(wrappedValue: TeamStore())
        }
    }

    var body: some Scene {
        WindowGroup {
            Group {
                if screenshotMode {
                    ScreenshotRootView(scene: screenshotScene)
                } else {
                    ContentView()
                }
            }
            .environmentObject(storePlayers)
            .environmentObject(teamStore)
        }
    }
}
