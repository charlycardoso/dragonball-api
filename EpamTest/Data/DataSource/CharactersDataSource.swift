//
//  CharactersDataSource.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

struct CharactersDataSource {
    private init() { }
    
    static let shared: CharactersDataSource = .init()
}

extension CharactersDataSource: GetcharacterUseCase, GetCharactersUseCase {
    func getCharacter(by id: String) async throws -> CharacterModel {
        let requestModel = RequestModel(method: .GET, endpoint: .Characters, urlData: [id])
        do {
            let request = try await ServiceLayer.callService(requestModel, CharacterModel.self)
            return request
        } catch let error as NetworkErrorHandler {
            throw error
        }
    }
    
    func getCharacters() async throws -> AllCharactersModel {
        let requestModel = RequestModel(method: .GET, endpoint: .Characters)
        do {
            let request = try await ServiceLayer.callService(requestModel, AllCharactersModel.self)
            return request
        } catch let error as NetworkErrorHandler {
            throw error
        }
    }
}
