//
//  CreatedPlayer.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import Foundation

struct CreatedPlayer: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let age: Int
    let jerseyNumber: Int
    let position: PlayerPosition
    let team: PlayerTeam
    let avatar: PlayerAvatar
}

enum PlayerPosition: String, CaseIterable, Codable, Equatable, Identifiable {
    case qb = "QB"
    case rb = "RB"
    case wr = "WR"
    case te = "TE"
    case lb = "LB"
    case cb = "CB"
    case s  = "S"
    case de = "DE"
    case dt = "DT"
    case k  = "K"
    case p  = "P"
    case c  = "C"
    case g  = "G"
    case ot = "OT"
    case ls = "LS"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .qb: return "Quarterback"
        case .rb: return "Running Back"
        case .wr: return "Wide Receiver"
        case .te: return "Tight End"
        case .lb: return "Linebacker"
        case .cb: return "Cornerback"
        case .s:  return "Safety"
        case .de: return "Defensive End"
        case .dt: return "Defensive Tackle"
        case .k:  return "Kicker"
        case .p:  return "Punter"
        case .c:  return "Center"
        case .g:  return "Guard"
        case .ot: return "Offensive Tackle"
        case .ls: return "Long Snapper"
        }
    }
}

enum PlayerTeam: String, CaseIterable, Codable, Equatable, Identifiable {
    case ari = "ARI"
    case atl = "ATL"
    case bal = "BAL"
    case buf = "BUF"
    case car = "CAR"
    case chi = "CHI"
    case cin = "CIN"
    case cle = "CLE"
    case dal = "DAL"
    case den = "DEN"
    case det = "DET"
    case gb  = "GB"
    case hou = "HOU"
    case ind = "IND"
    case jax = "JAX"
    case kc  = "KC"
    case lv  = "LV"
    case lac = "LAC"
    case lar = "LAR"
    case mia = "MIA"
    case min = "MIN"
    case ne  = "NE"
    case no  = "NO"
    case nyg = "NYG"
    case nyj = "NYJ"
    case phi = "PHI"
    case pit = "PIT"
    case sf  = "SF"
    case sea = "SEA"
    case tb  = "TB"
    case ten = "TEN"
    case wsh = "WSH"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .ari: return "Arizona Cardinals"
        case .atl: return "Atlanta Falcons"
        case .bal: return "Baltimore Ravens"
        case .buf: return "Buffalo Bills"
        case .car: return "Carolina Panthers"
        case .chi: return "Chicago Bears"
        case .cin: return "Cincinnati Bengals"
        case .cle: return "Cleveland Browns"
        case .dal: return "Dallas Cowboys"
        case .den: return "Denver Broncos"
        case .det: return "Detroit Lions"
        case .gb:  return "Green Bay Packers"
        case .hou: return "Houston Texans"
        case .ind: return "Indianapolis Colts"
        case .jax: return "Jacksonville Jaguars"
        case .kc:  return "Kansas City Chiefs"
        case .lv:  return "Las Vegas Raiders"
        case .lac: return "Los Angeles Chargers"
        case .lar: return "Los Angeles Rams"
        case .mia: return "Miami Dolphins"
        case .min: return "Minnesota Vikings"
        case .ne:  return "New England Patriots"
        case .no:  return "New Orleans Saints"
        case .nyg: return "New York Giants"
        case .nyj: return "New York Jets"
        case .phi: return "Philadelphia Eagles"
        case .pit: return "Pittsburgh Steelers"
        case .sf:  return "San Francisco 49ers"
        case .sea: return "Seattle Seahawks"
        case .tb:  return "Tampa Bay Buccaneers"
        case .ten: return "Tennessee Titans"
        case .wsh: return "Washington Commanders"
        }
    }
}

enum PlayerAvatar: String, CaseIterable, Codable, Equatable, Identifiable {
    case fire = "🔥"
    case bolt = "⚡️"
    case lion = "🦁"
    case rocket = "🚀"
    case star = "⭐️"

    var id: String { rawValue }
}
