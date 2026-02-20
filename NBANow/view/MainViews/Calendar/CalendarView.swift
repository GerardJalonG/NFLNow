import SwiftUI

struct CalendarView: View {

    @StateObject private var vm = ScoreBoardViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: UI.Sizes.extraLarge) {

                        Text("Calendar")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, UI.Sizes.page)
                            .foregroundColor(Color(.label))

                        if let error = vm.messageError {
                            Text(error)
                                .foregroundColor(Color(.systemRed))
                                .padding(.top, UI.Sizes.screen)
                                .frame(maxWidth: .infinity)
                        } else if let sb = vm.sb,
                                  let game = sb.events.first {
                            NavigationLink(
                                destination: GameStatsView(eventId: game.id)
                            ) {
                                GlobalGameCard(game: game, weekNumber: sb.week?.number ?? 0)
                            }
                            .padding(.horizontal, UI.Sizes.screen)
                        } else {
                            VStack(spacing: 10) {
                                ProgressView()
                                Text("Loading games...")
                                    .foregroundColor(Color(.secondaryLabel))
                            }
                            .padding(.top, UI.Sizes.screen)
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

