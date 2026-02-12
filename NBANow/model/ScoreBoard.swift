import Foundation

struct ScoreBoardResponse: Codable {
    let season: Season?
    let week: Week?
    let events: [Event]
}

struct Season: Codable {
    let type: Int?
    let year: Int?
}

struct Week: Codable {
    let number: Int?
}

struct Event: Codable {
    let id: String
    let uid: String?
    let date: String
    let name: String?
    let shortName: String?
    let competitions: [Competition]?
    let status: Status?
}

struct Competition: Codable {
    let id: String?
    let uid: String?
    let date: String?
    let attendance: Int?
    let neutralSite: Bool?
    let venue: Venue?
    let competitors: [Competitor]?
    let status: Status? 
}

struct Competitor: Codable {
    let id: String?
    let homeAway: String?
    let winner: Bool?
    let team: TeamMini?
    let score: String?
    let linescores: [LineScore]?
}

struct TeamMini: Codable {
    let id: String?
    let abbreviation: String?
    let displayName: String?
    let logo: String?
}

struct LineScore: Codable {
    let value: Double?
    let displayValue: String?
    let period: Int?
}

struct Status: Codable {
    let type: TypeStatus?
}

struct TypeStatus: Codable {
    let id: String?
    let description: String?
}
