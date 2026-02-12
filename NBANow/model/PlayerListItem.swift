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
