//
//  DefaultStorage.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 2/2/26.
//

import Foundation

final class DefaultsStorage {

    static let shared = DefaultsStorage()
    private init() {}

    private let defaults = UserDefaults.standard

    func loadFollowingTeamIDs() -> [String] {
        defaults.stringArray(forKey: DefaultsKeys.followingTeamIDs) ?? []
    }

    func saveFollowingTeamIDs(_ teams: [String]) {
        defaults.set(teams, forKey: DefaultsKeys.followingTeamIDs)
    }

    func loadFollowingPlayerIDs() -> [String] {
        defaults.stringArray(forKey: DefaultsKeys.followingPlayerIDs) ?? []
    }

    func saveFollowingPlayerIDs(_ players: [String]) {
        defaults.set(players, forKey: DefaultsKeys.followingPlayerIDs)
    }
}
