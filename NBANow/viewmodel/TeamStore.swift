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

    func add(_ team: Team){
        guard !isFollowing(team) else { return }
        guard teamIDs.count < maxTeams else { return }

        teamIDs.append(team.id)
        storage.saveFollowingTeamIDs(teamIDs)
        return
    }

    func remove(_ team: Team) {
        teamIDs.removeAll { $0 == team.id }
        storage.saveFollowingTeamIDs(teamIDs)
    }
}
