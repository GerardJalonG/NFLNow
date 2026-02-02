//
//  TeamOfSeasonStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

//
//  TeamOfSeasonStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import Foundation

final class TeamOfSeasonStore: ObservableObject {

    @Published private(set) var playerIDs: [String] = []

    private let storage = DefaultsStorage.shared
    private let maxPlayers = 5

    init() {
        playerIDs = storage.loadTeamOfSeasonPlayerIDs()
    }

    func isFollowing(_ player: PlayerListItem) -> Bool {
        playerIDs.contains(player.id)
    }

    func add(_ player: PlayerListItem) -> Bool {
        guard !isFollowing(player) else { return true }
        guard playerIDs.count < maxPlayers else { return false }

        playerIDs.append(player.id)
        storage.saveTeamOfSeasonPlayerIDs(playerIDs)
        return true
    }

    func remove(_ player: PlayerListItem) {
        playerIDs.removeAll { $0 == player.id }
        storage.saveTeamOfSeasonPlayerIDs(playerIDs)
    }
}
