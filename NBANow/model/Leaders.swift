import Foundation

/*
 Recursos para el apartado de información de estadísitcas en el header (y a lo mejor body) - Player_info & Team_infop
 */
struct GameLeaders: Codable {
    let team: Team
    let leaders: [GameLeaderCategory]
}

struct GameLeaderCategory: Codable {
    let name: String?
    let displayName: String?
    let leaders: [GameLeaderAthlete]
}

struct GameLeaderAthlete: Codable {
    let displayValue: String?
    let athlete: Athlete
    let mainStat: GameMainStat?
}

struct GameMainStat: Codable {
    let value: String?
    let label: String?
    let summary: String?
}

extension GameLeaders {
    func topPerformers() -> (statName: String, performer: GameLeaderAthlete)? {

        var highestValue = -1
        var topAthlete: GameLeaderAthlete?
        var statTitle = ""

        for category in leaders {
            guard
                let athlete = category.leaders.first,
                let valueString = athlete.mainStat?.value,
                let value = Int(valueString)
            else {
                continue
            }
            
            if value > highestValue {
                highestValue = value
                topAthlete = athlete
                statTitle = category.displayName ?? category.name ?? ""
            }
        }
        guard let finalAthlete = topAthlete else { return nil }
        return (statTitle, finalAthlete)
    }
}

