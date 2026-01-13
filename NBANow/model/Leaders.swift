import Foundation

struct Leaders: Codable {
    let id: String
    let categories: [CategoriesItems]
}

struct CategoriesItems: Codable {
    let displayName: String
    let abbreviation: String
    let leaders: [LeadersItems]
}

struct LeadersItems: Codable {
    let value: Int
    let athlete: Athlete
    let team: Team 
}

