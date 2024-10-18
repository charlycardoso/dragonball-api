//
//  CharactersRepository.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

protocol CharactersRepositoryProtocol {
    func getCharacters() async throws -> AllCharactersModel
    func getCharacters(by id: String) async throws -> CharacterModel
}

struct CharactersRepository {
    private let dataSource: CharactersDataSource
    
    init(dataSource: CharactersDataSource) {
        self.dataSource = dataSource
    }
}

extension CharactersRepository: CharactersRepositoryProtocol {
    func getCharacters() async throws -> AllCharactersModel {
        let data = try await dataSource.getCharacters()
        return data
    }
    
    func getCharacters(by id: String) async throws -> CharacterModel {
        let data = try await dataSource.getCharacter(by: id)
        return data
    }
}
