import Foundation

struct boxScore: Codable{
    let teams: [TeamStatistics]
    let players: [Player]
}

/*
 Recursos para la información del equipo (Nombres, logos...) y para el team comparision.
 */
struct TeamStatistics: Codable {
    let team: Team
    let statistics: [StatisticsItems]
}

struct StatisticsItems: Codable {
    let label: String
    let displayValue: String
    let abbreviation: String
}

/*
 Recursos para los top performers del partido - Game_Stats
 **Posible uso para los datos de resultados del jugador - Player_Info
 */
struct Player: Codable {
    let team: Team
    let statistics: [StatisticsPlayer]
}

struct StatisticsPlayer: Codable {
    let name: String
    let labels: [Labels]
    let descriptions: [Descriptions]
    let athletes: [AthleteInfo]
    let totals: [Totals]
}

struct AthleteInfo: Codable {
    let athlete: Athlete
    let stats: [StatisticsPlayerData]
}

struct StatisticsPlayerData: Codable {
    let firstData: String?
    let secondData: String?
    let thirdData: String?
    let fourthData: String?
    let fifthData: String?
    let sixthData: String?
    let seventhData: String?
    let eightData: String?
}

struct Labels: Codable {
    let firstData: String?
    let secondData: String?
    let thirdData: String?
    let fourthData: String?
    let fifthData: String?
    let sixthData: String?
    let seventhData: String?
    let eightData: String?
}

struct Descriptions: Codable {
    let firstData: String?
    let secondData: String?
    let thirdData: String?
    let fourthData: String?
    let fifthData: String?
    let sixthData: String?
    let seventhData: String?
    let eightData: String?
}

struct Totals: Codable {
    let firstData: String?
    let secondData: String?
    let thirdData: String?
    let fourthData: String?
    let fifthData: String?
    let sixthData: String?
    let seventhData: String?
    let eightData: String?
}

/*
 Info extra del partido - Game_Stats
 */
struct GameInfo: Codable {
    let officials: [Officials]
}

struct Officials: Codable {
    let displayName: String
    let positionOfficials: PositionOfficials
}

struct PositionOfficials: Codable {
    let id: String
    let displayName: String
}

struct Drives: Codable {
    let previous: [PreviousItem]
}

struct PreviousItem: Codable {
    let id: String
    let yards: Int
    let offensivePlays: Int
    let displayResult: String
    let team: Team
    let start: Start
    let end: End
}
/*
 **Posible extra para el campo de futbol Best Plays - Game_Stats
 */
struct Start: Codable {
    let yardLine: Int
}

struct End: Codable {
    let yardLine: Int
}

/*
 Recursos para poder hacer el top performers del partido - Game_Stats
 */
struct LeadersGameSummary: Codable {
    let team: Team
    let leaders: [LeadersGameSummaryStats]
}

struct LeadersGameSummaryStats: Codable {
    let displayName: String
    let leaders: [LeadersGameSummaryStatsAthlete]
}

struct LeadersGameSummaryStatsAthlete: Codable {
    let displayValue: String
    let athlete: Athlete
}

/*
 Info extra jugadores (lesionados durante el partido) - Game Stats
 */
struct Injuries: Codable {
    let team: Team
    let injuries: [InjuriesItems]
}

struct InjuriesItems: Codable {
    let status: String
    let date: Date
    let athlete: Athlete
}

/*
 Elemento estilo Data Science (Ciruclo) - Game Stats
 */
struct WinProbability: Codable {
    let playId: String
    let homeWinPercentage: Decimal
}


