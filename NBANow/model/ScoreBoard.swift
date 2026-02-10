import Foundation

struct ScoreBoardResponse: Codable {
    let leagues: [LeagueScoreboard]?
    let season: Season?
    let week: Week?
    let events: [Event]
    let provider: Provider?
}

struct LeagueScoreboard: Codable {
    let id: String?
    let uid: String?
    let name: String?
    let abbreviation: String?
    let slug: String?
    let season: LeagueSeason?
    let calendarType: String?
    let calendarStartDate: String?
    let calendarEndDate: String?
    let calendar: [CalendarSection]?
}

struct LeagueSeason: Codable {
    let year: Int?
    let startDate: String?
    let endDate: String?
    let displayName: String?
    let type: LeagueSeasonType?
}

struct LeagueSeasonType: Codable {
    let id: String?
    let type: Int?
    let name: String?
    let abbreviation: String?
}

struct CalendarSection: Codable {
    let label: String?
    let value: String?
    let startDate: String?
    let endDate: String?
    let entries: [CalendarEntry]?
}

struct CalendarEntry: Codable {
    let label: String?
    let alternateLabel: String?
    let detail: String?
    let value: String?
    let startDate: String?
    let endDate: String?
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
    let links: [Link]?
}

struct Competition: Codable {
    let id: String?
    let uid: String?
    let date: String?
    let attendance: Int?
    let neutralSite: Bool?
    let venue: Venue?
    let competitors: [Competitor]?
    let notes: [Note]?
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
    let clock: Double?
    let displayClock: String?
    let period: Int?
    let type: TypeStatus?
}

struct TypeStatus: Codable {
    let id: String?
    let name: String?
    let state: String?
    let completed: Bool?
    let description: String?
    let detail: String?
    let shortDetail: String?
}

struct Note: Codable {
    let type: String?
    let headline: String?
}

struct Link: Codable {
    let href: String?
    let text: String?
    let shortText: String?
    let isExternal: Bool?
    let isPremium: Bool?
}

struct Provider: Codable {
    let id: String?
    let name: String?
    let displayName: String?
}
