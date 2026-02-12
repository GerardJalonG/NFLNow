import Foundation

struct GameSummaryData: Codable {
    let header: GameHeader?
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
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        displayValue = try? container.decode(String.self, forKey: .displayValue)
        label = try? container.decode(String.self, forKey: .label)

        if let doubleValue = try? container.decode(Double.self, forKey: .value) {
            value = doubleValue
        } else if let intValue = try? container.decode(Int.self, forKey: .value) {
            value = Double(intValue)
        } else if let stringValue = try? container.decode(String.self, forKey: .value) {
            value = Double(stringValue.replacingOccurrences(of: ",", with: "."))
        } else {
            value = nil
        }
    }
}


struct GameHeader: Codable {
    let competitions: [GameCompetition]
}

struct GameCompetition: Codable {
    let competitors: [GameCompetitor]
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
