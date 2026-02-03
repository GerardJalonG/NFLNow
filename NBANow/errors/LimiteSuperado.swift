//
//  LimiteSuperado.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import Foundation

enum LimitReachedError: String, Identifiable {
    case maxTeams
    case maxPlayers

    var id: String { rawValue }

    var title: String { "Error" }

    var message: String {
        switch self {
        case .maxTeams:
            return "Solo puedes seguir hasta 5 equipos."
        case .maxPlayers:
            return "Solo puedes crear hasta 5 jugadores."
        }
    }
}
