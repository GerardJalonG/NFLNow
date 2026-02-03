//
//  PlayerCreationErrors.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import Foundation

enum PlayerCreationError: Identifiable {
    case emptyName
    case nameTooLong
    case invalidAge
    case invalidJersey
    case maxPlayersReached

    var id: String { title }

    var title: String {
        "Error"
    }

    var message: String {
        switch self {
        case .emptyName:
            return "El nombre no puede estar vacío."
        case .nameTooLong:
            return "Tu nombre no puede exceder los 30 caracteres."
        case .invalidAge:
            return "La edad debe estar entre 18 y 40."
        case .invalidJersey:
            return "El número debe estar entre 0 y 99."
        case .maxPlayersReached:
            return "Solo puedes crear hasta 5 jugadores."
        }
    }
}
