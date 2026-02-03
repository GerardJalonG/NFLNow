import Foundation

struct Roster: Codable {
    let team: Team
    let athletes: [AthleteGroup]
}

struct AthleteGroup: Codable {
    let position: String
    let items: [Athlete]
}

struct Athlete: Codable, Identifiable {
    let id: String
    let fullName: String
    let age: Int
    let jersey: String?
    let position: Position
    let headshot: Headshot?
}

struct Headshot: Codable {
    let href: String
}

struct Position: Codable {
    let abbreviation: String
    let displayName: String?
}
