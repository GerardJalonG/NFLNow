import Foundation

struct Root: Codable {
    let sports: [Sport]
}

struct Sport: Codable {
    let id: String
    let slug: String
    let leagues: [League]
}

struct League: Codable {
    let id: String
    let slug: String
    let teams: [TeamContainer]
}

struct TeamContainer: Codable {
    let team: Team
}

struct Team: Codable, Identifiable  {
    let id: String
    let abbreviation: String
    let displayName: String
    let shortDisplayName: String?
    let location: String
    let color: String
    let alternateColor: String
    let logos: [LogoItem]
    var franchise: Franchise?
    var record: Record?
    var standingSummary: String?
}

struct TeamDetail: Codable {
    let team: Team
}

struct LogoItem: Codable {
    let href: String
}

struct Franchise: Codable {
    let id: String
    let name: String
    let venue: Venue
}

struct Record: Codable {
    let items: [RecordItem]?
}

struct RecordItem: Codable {
    let type: String?
    let summary: String?
    let stats: [RecordStat]?
}

struct RecordStat: Codable {
    let name: String
    let value: Double
}

struct Venue: Codable {
    let fullName: String
}
