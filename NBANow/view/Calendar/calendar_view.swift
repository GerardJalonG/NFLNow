import SwiftUI

struct calendar_view: View {

    @StateObject private var vm = ScoreBoardViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 16) {

                        Text("Calendar")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .foregroundColor(Color(.label))

                        if let error = vm.messageError {
                            Text(error)
                                .foregroundColor(Color(.systemRed))
                                .padding(.top, 40)
                                .frame(maxWidth: .infinity)
                        } else if let sb = vm.sb,
                                  let game = sb.events.first {
                            NavigationLink(
                                destination: GameStatsView(eventId: game.id)
                            ) {
                                GameHomeCard(game: game, weekNumber: sb.week?.number ?? 0)
                            }
                            .padding(.horizontal, 20)
                        } else {
                            VStack(spacing: 10) {
                                ProgressView()
                                Text("Loading games...")
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.vertical, 24)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .onAppear {
                if vm.sb == nil && vm.messageError == nil {
                    vm.fetchScoreBoard()
                }
            }
        }
    }
}

