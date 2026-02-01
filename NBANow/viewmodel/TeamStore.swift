//
//  TeamStore.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import Foundation

final class TeamStore: ObservableObject {

    @Published var teams: [Team] = []

    let maxTeams = 5

    func isFollowing(_ team: Team) -> Bool {
        teams.contains { $0.id == team.id }
    }

    func add(_ team: Team) -> Bool {
        if isFollowing(team) {
            return false
        }

        if teams.count >= maxTeams {
            return false
        }

        teams.append(team)
        return true
    }

    func remove(_ team: Team) {
        teams.removeAll { $0.id == team.id }
    }
}
