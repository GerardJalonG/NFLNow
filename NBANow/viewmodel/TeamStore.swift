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
    private let usesPersistentStorage: Bool

    init(seededTeamIDs: [String] = [], usesPersistentStorage: Bool = true) {
        self.usesPersistentStorage = usesPersistentStorage
        if seededTeamIDs.isEmpty && usesPersistentStorage {
            teamIDs = storage.loadFollowingTeamIDs()
        } else {
            teamIDs = seededTeamIDs
        }
    }

    func isFollowing(_ team: Team) -> Bool {
        teamIDs.contains(team.id)
    }

    func add(_ team: Team){
        guard !isFollowing(team) else { return }
        guard teamIDs.count < maxTeams else { return }

        teamIDs.append(team.id)
        if usesPersistentStorage {
            storage.saveFollowingTeamIDs(teamIDs)
        }
        return
    }

    func remove(_ team: Team) {
        teamIDs.removeAll { $0 == team.id }
        if usesPersistentStorage {
            storage.saveFollowingTeamIDs(teamIDs)
        }
    }
}
