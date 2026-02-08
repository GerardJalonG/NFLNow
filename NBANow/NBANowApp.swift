import SwiftUI

@main
struct NBANowApp: App {
    @StateObject private var storePlayers = PlayerStore()
    @StateObject private var teamStore = TeamStore()

    var body: some Scene {
        WindowGroup {
            SampleView()
                .environmentObject(storePlayers)
                .environmentObject(teamStore)
        }
    }
}
