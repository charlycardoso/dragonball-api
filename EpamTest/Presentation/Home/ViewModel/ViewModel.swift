//
//  ViewModel.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    private let dataSource: CharactersRepository = CharactersRepository(dataSource: CharactersDataSource.shared)
    
    @Published var characters = [Item]()
    @Published var loadingContent: Bool = false
    @Published var error: CharacterErrorHandler?
    
    
    func getCharacter() -> Character? {
        guard let character = characters.first else { return nil }
        
        return .init(name: character.name, ki: character.ki, race: character.race, gender: character.gender.rawValue, image: character.image, description: character.description)
    }
}

@MainActor
extension HomeViewModel {
    
    func fetchCharacter(by id: String) async throws -> CharacterModel {
        let response = try await dataSource.getCharacters(by: id)
        return response
    }
    
    func fetchCharacters() async {
        loadingContent = true
        do {
            let response = try await dataSource.getCharacters()
            self.characters = response.items
        } catch {
            self.error = .EMPTY_LIST
        }
        
        loadingContent = false
    }
}
