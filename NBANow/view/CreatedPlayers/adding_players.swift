//
//  adding_players.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI

struct AddingPlayersView: View {

    @EnvironmentObject var playerStore: PlayerStore

    @Binding var isPresented: Bool

    @State private var playerName: String = ""
    @State private var playerAge: Int = 18
    @State private var playerJerseyNumber: Int = 0
    @State private var selectedPosition: PlayerPosition = .qb
    @State private var selectedTeam: PlayerTeam = .atl
    @State private var selectedAvatar: PlayerAvatar = .star

    @State private var error: PlayerCreationError?

    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("Name")) {
                    TextField("Player name", text: $playerName)
                }

                Section(header: Text("Age")) {
                    Stepper(value: $playerAge, in: 18...40) {
                        Text("\(playerAge)")
                    }
                }

                Section(header: Text("Jersey number")) {
                    Stepper(value: $playerJerseyNumber, in: 0...99) {
                        Text("\(playerJerseyNumber)")
                    }
                }

                Section(header: Text("Position")) {
                    Picker("Position", selection: $selectedPosition) {
                        ForEach(PlayerPosition.allCases) { position in
                            Text("\(position.displayName) (\(position.rawValue))")
                                .tag(position)
                        }
                    }
                }

                Section(header: Text("Team")) {
                    Picker("Team", selection: $selectedTeam) {
                        ForEach(PlayerTeam.allCases) { team in
                            Text("\(team.displayName) (\(team.rawValue))")
                                .tag(team)
                        }
                    }
                }

                Section(header: Text("Avatar")) {
                    Picker("Avatar", selection: $selectedAvatar) {
                        ForEach(PlayerAvatar.allCases) { avatar in
                            Text(avatar.rawValue)
                                .font(.largeTitle)
                                .tag(avatar)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
            }
            .navigationTitle("Create Player")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {

                        let resultado = playerStore.createPlayer(
                            name: playerName,
                            age: playerAge,
                            jerseyNumber: playerJerseyNumber,
                            position: selectedPosition,
                            team: selectedTeam,
                            avatar: selectedAvatar
                        )

                        if let errorCreacion = resultado {
                            error = errorCreacion
                        } else {
                            isPresented = false
                        }
                    }
                }
            }
            .alert(item: $error) { error in
                Alert(
                    title: Text(error.title),
                    message: Text(error.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct AddingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddingPlayersView(
            isPresented: .constant(true),
        )
        .environmentObject(PlayerStore())
    }
}
