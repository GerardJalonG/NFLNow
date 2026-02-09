import Foundation

struct Roster: Codable {
    let team: RosterTeam
    let athletes: [AthleteGroup]
}
struct RosterTeam: Codable, Identifiable {
    let id: String
    let abbreviation: String?
    let location: String?
    let name: String?
    let displayName: String?
    let clubhouse: String?
    let color: String?
    let logo: String?
    let recordSummary: String?
    let seasonSummary: String?
    let standingSummary: String?
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
