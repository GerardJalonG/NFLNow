import SwiftUI

@main
struct NBANowApp: App {
    @StateObject private var storePlayers = PlayerStore()
    @StateObject private var teamStore = TeamStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(storePlayers)
                .environmentObject(teamStore)
        }
    }
}
