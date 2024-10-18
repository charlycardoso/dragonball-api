//
//  GetcharacterUseCase.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

protocol GetcharacterUseCase {
    func getCharacter(by id: String) async throws -> CharacterModel
}
