//
//  FollowingPlayersStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import Foundation

final class PlayerStore: ObservableObject {

    @Published private(set) var players: [CreatedPlayer] = []

    private let storage = DefaultsStorage.shared
    private let maxPlayers = 5

    init() {
        players = storage.loadCreatedPlayers()
    }

    func createPlayer(
        name: String,
        age: Int,
        jerseyNumber: Int,
        position: PlayerPosition,
        team: PlayerTeam
    ) -> Bool {

        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)

        guard players.count < maxPlayers else { return false }
        guard !trimmed.isEmpty else { return false }
        guard trimmed.count <= 30 else { return false }
        guard (18...40).contains(age) else { return false }
        guard (0...99).contains(jerseyNumber) else { return false }

        let newPlayer = CreatedPlayer(
            id: UUID().uuidString,
            name: trimmed,
            age: age,
            jerseyNumber: jerseyNumber,
            position: position,
            team: team
        )

        players.append(newPlayer)
        storage.saveCreatedPlayers(players)
        return true
    }

    func remove(id: String) {
        players.removeAll { $0.id == id }
        storage.saveCreatedPlayers(players)
    }
}
