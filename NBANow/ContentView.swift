import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Home")
            .font(.largeTitle)
    }
}

struct CalendarView: View {
    var body: some View {
        Text("Calendar")
            .font(.largeTitle)
    }
}

struct SampleView: View {
    var body: some View {
        TabView {
            home_view()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            calendar_view()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }

            default_profile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
            .environmentObject(TeamStore())
            .environmentObject(PlayerStore())
    }
}
