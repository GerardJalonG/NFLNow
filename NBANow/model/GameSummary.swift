import Foundation

struct GameSummaryData: Codable {
    let header: GameHeader?
    let winprobability: [WinProbability]?
    let gameInfo: GameInfo?
}

struct GameHeader: Codable {
    let competitions: [GameCompetition]
}

struct GameCompetition: Codable {
    let status: GameStatus
    let competitors: [GameCompetitor]
}

struct GameStatus: Codable {
    let type: GameStatusType
}

struct GameStatusType: Codable {
    let description: String
}

struct GameCompetitor: Codable {
    let homeAway: String
    let team: Team
    let score: String?
    let winner: Bool?
    let linescores: [GameLineScore]?
}

struct GameLineScore: Codable {
    let displayValue: String
}

extension GameCompetitor {
    func totalScore() -> String {
        guard let linescores else { return "-" }

        var total = 0
        for line in linescores {
            if let value = Int(line.displayValue) { total += value }
        }
        return "\(total)"
    }
}

struct GameInfo: Codable {
    let officials: [Official]
}

struct Official: Codable {
    let displayName: String
}

struct WinProbability: Codable {
    let playId: String
    let homeWinPercentage: Decimal
}
