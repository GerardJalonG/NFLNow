
import SwiftUI

struct profile_row: View {
    let title: String
    var body: some View {
        HStack {
            Text("\(title)")
                .bold()
            Spacer()
            Image(systemName: "plus")
            HStack {
                
            }
        }.padding(.horizontal, 30)
    }
}

struct default_profile: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text("NFLNow").padding(.bottom, 40)
            //header
                profile_row(title: "MY TEAMS")
                Spacer()
                profile_row(title: "MY PLAYERS")
                Spacer()
                profile_row(title: "MY TEAM OF THE SEASON")
                Spacer()
            //navbar
            }
        }
    }
}

struct default_profile_Previews: PreviewProvider {
    static var previews: some View {
        default_profile()
    }
}


