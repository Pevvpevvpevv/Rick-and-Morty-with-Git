//
//  Model.swift
//  Rick-and-Morty
//
//  Created by Maxim Maxim on 03.06.2024.
//

import Foundation

struct MainModel: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Result: Codable {
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

struct Location: Codable {
    let name: String
    let url: String
}

//struct MainModel: Decodable {
//    let info: Info
//    let results: [Result]
//}
//
//struct Info: Decodable {
//    let count: Int
//    let pages: Int
//    let next: String?
//    let prev: String?
//}
//
//struct Result: Decodable {
//    let id: Int
//    let name: String
//    let status: String
//    let species: String
//    let type: String
//    let gender: String
//    let origin: Location
//    let location: Location
//    let image: String
//    let episode: [String]
//    let url: String
//    let created: String
//}
//
//struct CharacterMock: Decodable {
//    let name: String
//    let status: String
//    let image: String
//    let episode: Episode
//}
//
//struct Location: Decodable {
//    let name: String
//    let url: String
//}
//
//struct Episode: Decodable {
//    let name: String
//    let episode: String
//}


