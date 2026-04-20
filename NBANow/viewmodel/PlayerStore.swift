//
//  FollowingPlayersStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//
import Foundation

final class PlayerStore: ObservableObject {

    @Published private(set) var players: [CreatedPlayer] = []

    private let storage = DefaultStorage.shared
    private let maxPlayers = 5
    private let usesPersistentStorage: Bool

    init(seededPlayers: [CreatedPlayer] = [], usesPersistentStorage: Bool = true) {
        self.usesPersistentStorage = usesPersistentStorage
        if seededPlayers.isEmpty && usesPersistentStorage {
            players = storage.loadCreatedPlayers()
        } else {
            players = seededPlayers
        }
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

        let newPlayer = CreatedPlayer(
            id: UUID().uuidString,
            name: trimmed,
            age: age,
            jerseyNumber: String(jerseyNumber),
            position: position,
            team: team,
            avatar: avatar
        )

        players.append(newPlayer)
        if usesPersistentStorage {
            storage.saveCreatedPlayers(players)
        }
        return nil
    }

    func remove(id: String) {
        players.removeAll { $0.id == id }
        if usesPersistentStorage {
            storage.saveCreatedPlayers(players)
        }
    }
}
