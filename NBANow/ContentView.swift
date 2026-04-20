import SwiftUI

struct homeView: View {
    var body: some View {
        Text("Home")
            .font(.largeTitle)
    }
}

struct calendarView: View {
    var body: some View {
        Text("Calendar")
            .font(.largeTitle)
    }
}

struct ContentView: View {
    private let initialTab: Int
    @State private var selectedTab: Int

    init(initialTab: Int = 0) {
        self.initialTab = initialTab
        _selectedTab = State(initialValue: initialTab)
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag(0)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            CalendarView()
                .tag(1)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }

            PersonalProfile()
                .tag(2)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .onAppear {
            selectedTab = initialTab
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TeamStore())
            .environmentObject(PlayerStore())
    }
}
