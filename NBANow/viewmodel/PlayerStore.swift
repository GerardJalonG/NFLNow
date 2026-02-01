//
//  PlayerStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

import Foundation

class FollowingPlayersStore: ObservableObject {

    @Published var players: [PlayerListItem] = []

    let maxPlayers = 5
    
    func isFollowing(_ player: PlayerListItem) -> Bool {
        players.contains { $0.id == player.id }
    }

    func add(playerAdded player: PlayerListItem) -> Bool {
        if isFollowing(player) {
            return false
        }

        if players.count >= maxPlayers {
            return false
        }

        players.append(player)
        return true
    }

    func remove(_ player: PlayerListItem) {
        players.removeAll { $0.id == player.id }
    }
}
