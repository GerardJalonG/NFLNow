//
//  FollowingPlayersStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import Foundation

final class FollowingPlayersStore: ObservableObject {

    @Published private(set) var playerIDs: [String] = []

    private let storage = DefaultsStorage.shared
    private let maxPlayers = 5
    
    init() {
        playerIDs = storage.loadFollowingPlayerIDs()
    }

    func isFollowing(id: String) -> Bool {
           playerIDs.contains(id)
       }

       func add(id: String) -> Bool {
           guard !isFollowing(id: id) else { return true }
           guard playerIDs.count < maxPlayers else { return false }

           playerIDs.append(id)
           storage.saveFollowingPlayerIDs(playerIDs)
           return true
       }

       func remove(id: String) {
           playerIDs.removeAll { $0 == id }
           storage.saveFollowingPlayerIDs(playerIDs)
       }
}
