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
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            

            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }

            PersonalProfile()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
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
