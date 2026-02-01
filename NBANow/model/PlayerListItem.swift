//
//  PlayerListItem.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

import Foundation

struct PlayerListItem: Identifiable, Equatable {
    let id: String
    let name: String
    let teamName: String
    let teamAbbreviation: String
    let jersey: String
    let position: String
    let headshotURL: String?
}

extension PlayerListItem {
    static let mockPlayers: [PlayerListItem] = [
        PlayerListItem(
            id: "1",
            name: "CeeDee Lamb",
            teamName: "Dallas Cowboys",
            teamAbbreviation: "DAL",
            jersey: "88",
            position: "WR",
            headshotURL: nil
        ),
        PlayerListItem(
            id: "2",
            name: "Dak Prescott",
            teamName: "Dallas Cowboys",
            teamAbbreviation: "DAL",
            jersey: "4",
            position: "QB",
            headshotURL: nil
        ),
        PlayerListItem(
            id: "3",
            name: "T.J. Watt",
            teamName: "Pittsburgh Steelers",
            teamAbbreviation: "PIT",
            jersey: "90",
            position: "LB",
            headshotURL: nil
        ),
        PlayerListItem(
            id: "4",
            name: "Sam Darnold",
            teamName: "Seattle Seahawks",
            teamAbbreviation: "SEA",
            jersey: "14",
            position: "QB",
            headshotURL: nil
        ),
        PlayerListItem(
                    id: "5",
                    name: "Christian McCaffrey",
                    teamName: "San Francisco 49ers",
                    teamAbbreviation: "SF",
                    jersey: "23",
                    position: "RB",
                    headshotURL: nil
                ),
                PlayerListItem(
                    id: "6",
                    name: "Josh Allen",
                    teamName: "Buffalo Bills",
                    teamAbbreviation: "BUF",
                    jersey: "17",
                    position: "QB",
                    headshotURL: nil
                )
    ]
}
