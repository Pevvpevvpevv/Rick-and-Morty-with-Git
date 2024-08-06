
import Foundation

// MARK: - Episodes
struct Episodes: Decodable {
    let info: EpisodesInfo
    let results: [EpisodesResult]
}

// MARK: - EpisodesInfo
struct EpisodesInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}

// MARK: - EpisodesResult
struct EpisodesResult: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
}
