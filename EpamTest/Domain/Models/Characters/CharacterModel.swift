//
//  CharacterModel.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import Foundation

// MARK: - CharacterModel
struct CharacterModel: Codable {
    let id: Int
    let name, ki, maxKi, race: String
    let gender, description: String
    let image: String
    let affiliation: String
    let deletedAt: JSONNull?
    let originPlanet: OriginPlanet
    let transformations: [Transformation]
}

// MARK: - OriginPlanet
struct OriginPlanet: Codable {
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
    let deletedAt: JSONNull?
}

// MARK: - Transformation
struct Transformation: Codable {
    let id: Int
    let name: String
    let image: String
    let ki: String
    let deletedAt: JSONNull?
}
