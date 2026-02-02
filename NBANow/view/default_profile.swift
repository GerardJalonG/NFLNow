
import SwiftUI
import KingfisherSwiftUI



struct default_profile: View {
    
    @EnvironmentObject var teamStore: TeamStore
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                
                profile_row(title: "MY TEAMS")
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(teamStore.teams) { team in
                            if let logoURL = team.logos.first?.href,
                               let url = URL(string: logoURL) {
                                KFImage(url)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 52, height: 52)
                            } else {
                                Rectangle()
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    .frame(width: 52, height: 52)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                }
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


