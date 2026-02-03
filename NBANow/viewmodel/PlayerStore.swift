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
        team: PlayerTeam,
        avatar: PlayerAvatar
    ) -> PlayerCreationError? {

        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)

        if players.count >= maxPlayers { return .maxPlayersReached }
        if trimmed.isEmpty { return .emptyName }
        if trimmed.count > 30 { return .nameTooLong }
        if !(18...40).contains(age) { return .invalidAge }
        if !(0...99).contains(jerseyNumber) { return .invalidJersey }

        let newPlayer = CreatedPlayer(
            id: UUID().uuidString,
            name: trimmed,
            age: age,
            jerseyNumber: jerseyNumber,
            position: position,
            team: team,
            avatar: avatar
        )

        players.append(newPlayer)
        storage.saveCreatedPlayers(players)
        return nil
    }

    func remove(id: String) {
        players.removeAll { $0.id == id }
        storage.saveCreatedPlayers(players)
    }
}
