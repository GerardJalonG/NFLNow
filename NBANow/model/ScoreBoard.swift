import Foundation

/*
 Recursos para hacer el slider de filtrado de fecha para ver los partidos de la semana / mes - default_Calendar
 */
struct Season: Codable {
    let type: Int
    let year: Int
}

struct Week: Codable {
    let number: Int
}

/*
Partidos que se disputan dicha fecha filtrada - default_Calendar
 */
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

/*
 Recursos para "acentuar" los resultados del equipo ganador (gracias al booleano) y para el posicionamiento de los equipos en la tarjeta (deracha o izquierda)
 */
struct Competitions: Codable {
    let id: String
    let competitors: [Competitors]
    let status: Status
}

struct Competitors: Codable {
    let id: String
    let homeAway: String
    let winner: Bool
    let linescores: [LineScores]
}

/*
 Recursos para mostrar "Final" cuando el partido se ha terminado - deafult_Calendar & game_Stats
 */
struct Status: Codable {
    let type: TypeStatus
}

struct TypeStatus: Codable {
    let description: String
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
