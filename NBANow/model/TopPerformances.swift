//
//  TopPerformances.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 28/1/26.
//

import Foundation

struct TopPerformanceItem: Identifiable {
    let id = UUID()
    let metric: String
    let valueText: String
    let progress: Double
}

enum TopPerformances {
    case qb(QB)
    case rb(RB)
    case receiver(Receiver)
    case defense(Defense)
    case kicker(Kicker)
    case punter(Punter)
    case lineman(Lineman)
    case specialTeam(SpecialTeam)

    enum QB { case passYds, td, qbr }
    enum RB { case rushYds, td, ypc }
    enum Receiver { case recYds, rec, td }
    enum Defense { case tackles, sacks, pd }
    enum Kicker { case fgPct, long, points }
    enum Punter { case avg, inside20, long }
    enum Lineman { case snaps, penalties, sacksAllowed }
    enum SpecialTeam { case snaps, tackles, fumblesRec }
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

        case .specialTeam(let stMetric):
            switch stMetric {
            case .snaps: return "ST SNAPS"
            case .tackles: return "ST TACKLES"
            case .fumblesRec: return "FUM REC"
            }
        }
    }
}

struct TopPerformancesStats {

    let items: [TopPerformanceItem]

    init(player: Athlete) {

        switch PlayerPositions(player: player) {

        case .qb:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.qb(.passYds).metric,
                    valueText: "3,842",
                    progress: min(3842.0 / 5000.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.qb(.td).metric,
                    valueText: "28",
                    progress: min(28.0 / 50.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.qb(.qbr).metric,
                    valueText: "67.4",
                    progress: min(67.4 / 100.0, 1.0)
                )
            ]

        case .rb:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.rb(.rushYds).metric,
                    valueText: "1,120",
                    progress: min(1120.0 / 2000.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.rb(.td).metric,
                    valueText: "9",
                    progress: min(9.0 / 25.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.rb(.ypc).metric,
                    valueText: "4.6",
                    progress: min(4.6 / 7.0, 1.0)
                )
            ]

        case .receiver:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.receiver(.recYds).metric,
                    valueText: "1,012",
                    progress: min(1012.0 / 1800.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.receiver(.rec).metric,
                    valueText: "78",
                    progress: min(78.0 / 130.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.receiver(.td).metric,
                    valueText: "7",
                    progress: min(7.0 / 20.0, 1.0)
                )
            ]

        case .defense:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.defense(.tackles).metric,
                    valueText: "96",
                    progress: min(96.0 / 160.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.defense(.sacks).metric,
                    valueText: "7.5",
                    progress: min(7.5 / 20.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.defense(.pd).metric,
                    valueText: "9",
                    progress: min(9.0 / 25.0, 1.0)
                )
            ]

        case .kicker:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.kicker(.fgPct).metric,
                    valueText: "87.9%",
                    progress: min(87.9 / 100.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.kicker(.long).metric,
                    valueText: "54",
                    progress: min(54.0 / 70.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.kicker(.points).metric,
                    valueText: "129",
                    progress: min(129.0 / 180.0, 1.0)
                )
            ]

        case .punter:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.punter(.avg).metric,
                    valueText: "47.1",
                    progress: min(47.1 / 55.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.punter(.inside20).metric,
                    valueText: "28",
                    progress: min(28.0 / 40.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.punter(.long).metric,
                    valueText: "66",
                    progress: min(66.0 / 80.0, 1.0)
                )
            ]

        case .lineman:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.lineman(.snaps).metric,
                    valueText: "1,067",
                    progress: min(1067.0 / 1200.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.lineman(.penalties).metric,
                    valueText: "7",
                    progress: min(7.0 / 15.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.lineman(.sacksAllowed).metric,
                    valueText: "3",
                    progress: min(3.0 / 12.0, 1.0)
                )
            ]

        case .specialTeam:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.specialTeam(.snaps).metric,
                    valueText: "245",
                    progress: min(245.0 / 400.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.specialTeam(.tackles).metric,
                    valueText: "9",
                    progress: min(9.0 / 25.0, 1.0)
                ),
                TopPerformanceItem(
                    metric: TopPerformances.specialTeam(.fumblesRec).metric,
                    valueText: "1",
                    progress: min(1.0 / 5.0, 1.0)
                )
            ]
        }
    }
}
