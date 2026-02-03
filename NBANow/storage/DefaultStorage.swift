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

    func loadCreatedPlayers() -> [CreatedPlayer] {
        guard let data = defaults.data(forKey: DefaultsKeys.CreatedPlayers) else { return [] }
        return (try? JSONDecoder().decode([CreatedPlayer].self, from: data)) ?? []
    }

    func saveCreatedPlayers(_ players: [CreatedPlayer]) {
        let data = try? JSONEncoder().encode(players)
        defaults.set(data, forKey: DefaultsKeys.CreatedPlayers)
    }
}
