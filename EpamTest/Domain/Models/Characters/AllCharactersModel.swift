//
//  AllCharactersModel.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import Foundation

// MARK: - AllCharactersModel
struct AllCharactersModel: Codable {
    let items: [Item]
    let meta: Meta
    let links: Links
}

// MARK: - Item
struct Item: Codable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender: Gender
    let description: String
    let image: String
    let affiliation: Affiliation
    let deletedAt: JSONNull?
}

enum Affiliation: String, Codable {
    case armyOfFrieza = "Army of Frieza"
    case freelancer = "Freelancer"
    case zFighter = "Z Fighter"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}

// MARK: - Links
struct Links: Codable {
    let first: String
    let previous: String
    let next, last: String
}

// MARK: - Meta
struct Meta: Codable {
    let totalItems, itemCount, itemsPerPage, totalPages: Int
    let currentPage: Int
}
