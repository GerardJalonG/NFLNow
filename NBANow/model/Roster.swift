import Foundation


struct Roster: Codable {
    let team: Team
    let athletes: [AthleteItems]
}

struct AthleteItems: Codable {
    let position: String
    let items: [Athlete]
}

struct Athlete: Codable {
    let id: String
    let fullName: String
    let shortName: String
    let displayWeight: String
    let displayHeight: String
    let age: Int
    let birthPlace: BirthPlace
    let college: College
    let jersey: String
    let position: Position
    let experience: YearsActive
}

struct BirthPlace: Codable {
    let city: String
    let state: String
    let country: String
}

struct College: Codable {
    let id: String
    let name: String
    let mascot: String
    let logos: [Logo]
}

struct Logo: Codable {
    let href: String
    let width: Int
    let height: Int
}

struct Position: Codable {
    let id: String
    let displayName: String
    let abbreviation: String
    let parent: ParentPosition
}

struct ParentPosition: Codable {
    let id: String
    let displayName: String
}

struct YearsActive: Codable {
    let years: Int
}
