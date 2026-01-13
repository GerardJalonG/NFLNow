import Foundation

//Con season y Week es como se ven los partidos de la semana que quieres.
struct Season: Codable {
    let type: Int
    let year: Int
}

struct Week: Codable {
    let number: Int
}

struct Events: Codable {
    let eventsGames: [EventsGames]
}

struct EventsGames: Codable {
    let id: String
    let date: Date
    let name: String
    let shortName: String
    let competitions: [Competitions]
}

struct Competitions: Codable {
    let id: String
    let competitors: [Competitors]
}

struct Competitors: Codable {
    let id: String
    let homeAway: String
    let winner: Bool
    let linescores: [LineScores]
}

/*
 Recursos para la muestra de puntos por cuartos - Game_Stats
 */
struct LineScores: Codable {
    let lineScoresItems: LineScoresItems
}

struct LineScoresItems: Codable {
    let value: Int
    let displayValue: String
    let period: Int
}
