import SwiftUI

struct ScreenshotRootView: View {
    let scene: ScreenshotScene

    var body: some View {
        switch scene {
        case .home:
            ContentView(initialTab: 0)
        case .calendar:
            ContentView(initialTab: 1)
        case .profile:
            ContentView(initialTab: 2)
        case .teamInfo:
            TeamInfo(team: ScreenshotDemoData.teamDetail)
        case .addTeam:
            AddingTeamsView()
        }
    }
}
