//
//  TopPerformances.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 28/1/26.
//

import Foundation

enum TopPerformances {
    case qb(QB)
    case rb(RB)
    case receiver(Receiver)
    case defense(Defense)
    case kicker(Kicker)
    case punter(Punter)
    case lineman(Lineman)

    enum QB { case passYds, td, qbr }
    enum RB { case rushYds, td, ypc }
    enum Receiver { case recYds, rec, td }
    enum Defense { case tackles, sacks, pd }
    enum Kicker { case fgPct, long, points }
    enum Punter { case avg, inside20, long }
    enum Lineman { case snaps, penalties, sacksAllowed }
}

extension TopPerformances {
    var metric: String {
        switch self {
        case .qb(let qbMetric):
            switch qbMetric {
            case .passYds: return "PASS YDS"
            case .td: return "TD"
            case .qbr: return "QBR"
            }

        case .rb(let rbMetric):
            switch rbMetric {
            case .rushYds: return "RUSH YDS"
            case .td: return "RUSH TD"
            case .ypc: return "YPC"
            }

        case .receiver(let receiverMetric):
            switch receiverMetric {
            case .recYds: return "REC YDS"
            case .rec: return "REC"
            case .td: return "REC TD"
            }

        case .defense(let defenseMetric):
            switch defenseMetric {
            case .tackles: return "TACKLES"
            case .sacks: return "SACKS"
            case .pd: return "PD"
            }

        case .kicker(let kickerMetric):
            switch kickerMetric {
            case .fgPct: return "FG %"
            case .long: return "LONG"
            case .points: return "PTS"
            }

        case .punter(let punterMetric):
            switch punterMetric {
            case .avg: return "AVG"
            case .inside20: return "IN 20"
            case .long: return "LONG"
            }

        case .lineman(let linemanMetric):
            switch linemanMetric {
            case .snaps: return "SNAPS"
            case .penalties: return "PEN"
            case .sacksAllowed: return "SACKS ALW"
            }
        }
    }
}
