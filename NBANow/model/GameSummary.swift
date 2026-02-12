import Foundation

struct GameSummaryData: Codable {
    let header: GameHeader?
    let winprobability: [WinProbability]?
    let gameInfo: GameInfo?
    let boxscore: Boxscore?
}

struct Boxscore: Codable {
    let teams: [BoxscoreTeam]
}

struct BoxscoreTeam: Codable {
    let homeAway: String?
    let team: TeamSummary
    let statistics: [TeamStatistic]
}

struct TeamSummary: Codable {
    let id: String
    let abbreviation: String
    let displayName: String
    let logo: String?
    let color: String?
    let alternateColor: String?
}

struct TeamStatistic: Codable {
    let name: String
    let displayValue: String?
    let value: Double?
    let label: String?

    enum CodingKeys: String, CodingKey { case name, displayValue, value, label }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)

        name = try c.decode(String.self, forKey: .name)
        displayValue = try? c.decode(String.self, forKey: .displayValue)
        label = try? c.decode(String.self, forKey: .label)

        if let d = try? c.decode(Double.self, forKey: .value) {
            value = d
        } else if let i = try? c.decode(Int.self, forKey: .value) {
            value = Double(i)
        } else if let s = try? c.decode(String.self, forKey: .value) {
            value = Double(s.replacingOccurrences(of: ",", with: "."))
        } else {
            value = nil
        }
    }
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
