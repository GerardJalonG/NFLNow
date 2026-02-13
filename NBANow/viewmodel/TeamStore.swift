//
//  TeamStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import Foundation
final class TeamStore: ObservableObject {

    @Published private(set) var teamIDs: [String] = []

    private let storage = DefaultStorage.shared
    private let maxTeams = 5

    init() {
        teamIDs = storage.loadFollowingTeamIDs()
    }

    func isFollowing(_ team: Team) -> Bool {
        teamIDs.contains(team.id)
    }

    func add(_ team: Team) -> Bool {
        guard !isFollowing(team) else { return true }
        guard teamIDs.count < maxTeams else { return false }

        teamIDs.append(team.id)
        storage.saveFollowingTeamIDs(teamIDs)
        return true
    }

    func remove(_ team: Team) {
        teamIDs.removeAll { $0 == team.id }
        storage.saveFollowingTeamIDs(teamIDs)
    }
}
