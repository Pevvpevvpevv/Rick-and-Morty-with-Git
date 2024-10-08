
import Foundation

struct Characters: Decodable {
    let info: CharactersInfo
    let results: [CharactersResult]
}

struct CharactersInfo: Decodable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}

struct CharactersResult: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Decodable {
    let name: String
    let url: String
}

struct Episode: Decodable {
    let name: String
    let episode: String
}
