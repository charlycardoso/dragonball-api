//
//  GetCharactersUseCase.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

protocol GetCharactersUseCase {
    func getCharacters() async throws -> AllCharactersModel
}
