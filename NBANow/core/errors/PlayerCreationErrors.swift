//
//  PlayerCreationErrors.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import Foundation

enum PlayerCreationError: String, Identifiable {
    case emptyName
    case nameTooLong
    case maxPlayersReached

    var id: String { rawValue }

    var title: String {
        "Error"
    }

    var message: String {
        switch self {
        case .emptyName:
            return "El nombre no puede estar vacío."
        case .nameTooLong:
            return "Tu nombre no puede exceder los 30 caracteres."
        case .maxPlayersReached:
            return "Solo puedes crear hasta 5 jugadores."
        }
    }
}
