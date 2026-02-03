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
    let playerName: String
    let playerValueText: String
    let playerProgress: Double
    let playerColor: String
    let opponentName: String
    let opponentValueText: String
    let opponentProgress: Double
    let opponentColor: String
    let gameDate: Date?
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

        let dates: [Date?] = [
            randomGameDate(),
            randomGameDate(),
            randomGameDate()
        ]

        let opponentNames = [
            "Dallas Cowboys",
            "Green Bay Packers",
            "Kansas City Chiefs"
        ]

        let opponentColors = [
            "003594",
            "203731",
            "E31837"
        ]

        let playerName = player.fullName
        let playerColor = "FF9500"

        switch PlayerPositions(player: player) {

        case .qb:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.qb(.passYds).metric,
                    playerName: playerName,
                    playerValueText: "4,215",
                    playerProgress: min(4215.0 / 5000.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "3,640",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.qb(.td).metric,
                    playerName: playerName,
                    playerValueText: "33",
                    playerProgress: min(33.0 / 50.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "27",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.qb(.qbr).metric,
                    playerName: playerName,
                    playerValueText: "72.8",
                    playerProgress: min(72.8 / 100.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "65.1",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .rb:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.rb(.rushYds).metric,
                    playerName: playerName,
                    playerValueText: "1,356",
                    playerProgress: min(1356.0 / 2000.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "982",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.rb(.td).metric,
                    playerName: playerName,
                    playerValueText: "12",
                    playerProgress: min(12.0 / 25.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "8",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.rb(.ypc).metric,
                    playerName: playerName,
                    playerValueText: "5.2",
                    playerProgress: min(5.2 / 7.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "4.1",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .receiver:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.receiver(.recYds).metric,
                    playerName: playerName,
                    playerValueText: "1,244",
                    playerProgress: min(1244.0 / 1800.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "1,010",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.receiver(.rec).metric,
                    playerName: playerName,
                    playerValueText: "92",
                    playerProgress: min(92.0 / 130.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "71",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.receiver(.td).metric,
                    playerName: playerName,
                    playerValueText: "9",
                    playerProgress: min(9.0 / 20.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "6",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .defense:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.defense(.tackles).metric,
                    playerName: playerName,
                    playerValueText: "112",
                    playerProgress: min(112.0 / 160.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "89",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.defense(.sacks).metric,
                    playerName: playerName,
                    playerValueText: "9.0",
                    playerProgress: min(9.0 / 20.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "6.5",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.defense(.pd).metric,
                    playerName: playerName,
                    playerValueText: "14",
                    playerProgress: min(14.0 / 25.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "10",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .kicker:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.kicker(.fgPct).metric,
                    playerName: playerName,
                    playerValueText: "91.3%",
                    playerProgress: min(91.3 / 100.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "85.6%",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.kicker(.long).metric,
                    playerName: playerName,
                    playerValueText: "61",
                    playerProgress: min(61.0 / 70.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "55",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.kicker(.points).metric,
                    playerName: playerName,
                    playerValueText: "142",
                    playerProgress: min(142.0 / 180.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "118",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .punter:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.punter(.avg).metric,
                    playerName: playerName,
                    playerValueText: "49.8",
                    playerProgress: min(49.8 / 55.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "46.3",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.punter(.inside20).metric,
                    playerName: playerName,
                    playerValueText: "33",
                    playerProgress: min(33.0 / 40.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "26",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.punter(.long).metric,
                    playerName: playerName,
                    playerValueText: "72",
                    playerProgress: min(72.0 / 80.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "65",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .lineman:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.lineman(.snaps).metric,
                    playerName: playerName,
                    playerValueText: "1,145",
                    playerProgress: min(1145.0 / 1200.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "1,032",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.lineman(.penalties).metric,
                    playerName: playerName,
                    playerValueText: "4",
                    playerProgress: min(4.0 / 15.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "7",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.lineman(.sacksAllowed).metric,
                    playerName: playerName,
                    playerValueText: "1",
                    playerProgress: min(1.0 / 12.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "5",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]

        case .specialTeam:
            items = [
                TopPerformanceItem(
                    metric: TopPerformances.specialTeam(.snaps).metric,
                    playerName: playerName,
                    playerValueText: "310",
                    playerProgress: min(310.0 / 400.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[0],
                    opponentValueText: "255",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[0],
                    gameDate: dates[0]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.specialTeam(.tackles).metric,
                    playerName: playerName,
                    playerValueText: "13",
                    playerProgress: min(13.0 / 25.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[1],
                    opponentValueText: "9",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[1],
                    gameDate: dates[1]
                ),
                TopPerformanceItem(
                    metric: TopPerformances.specialTeam(.fumblesRec).metric,
                    playerName: playerName,
                    playerValueText: "2",
                    playerProgress: min(2.0 / 5.0, 1.0),
                    playerColor: playerColor,
                    opponentName: opponentNames[2],
                    opponentValueText: "1",
                    opponentProgress: 1.0,
                    opponentColor: opponentColors[2],
                    gameDate: dates[2]
                )
            ]
        }
    }
}
