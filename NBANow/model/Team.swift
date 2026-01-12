import Foundation

//teams: id, abbreviation, displayName, location, color, alternateColor, logos ->0 href,
//teamDetail{id}: franchise -> venue -> fullName, nextEvent[...]

struct TeamResponse: Codable {
    let team: Team
}

struct Team: Codable {
    let id: String
    let abbreviation: String
    let displayName: String
    let shortDisplayName: String
    let location: String
    let color: String
    let alternateColor: String
    //let logos: Logo?
    //let record Para Despues
    //groups ver si es WCOAST
    let franchise: Franchise
    let record: NextEvent
}

struct Franchise: Codable {
    let id: String
    let fullName: String
    let address: Address?
}


struct NextEventResponse: Codable {
    let nextEvent: NextEvent
}

struct NextEvent: Codable, Identifiable {
    let id: String
    let date: String
    let venue: Venue
    let competitions: [Competition]
}

struct Venue: Codable {
    let fullName: String
    let address: Address
}

struct Address: Codable {
    let city: String
    let state: String
}

struct Competition: Codable {
    let id: String
    let date: String
    let competitors: [Competitors]
    
}

struct Competitors: Codable {
    let id: String
    let homeAway: String //Para saber donde colocar o bien izq. o der.
    let team: Team
    let score: ScoreInfo?
}

struct ScoreInfo: Codable {
    let value: Int
}

//Standing SUmmary si no tenemos posicion en conference
