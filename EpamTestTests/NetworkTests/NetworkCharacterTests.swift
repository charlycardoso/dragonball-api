//
//  NetworkCharacterTests.swift
//  EpamTestTests
//
//  Created by Carlos Cardoso on 17/10/24.
//

import XCTest
@testable import EpamTest

final class NetworkCharacterTests: XCTestCase {
    private var characterDataSource: CharactersDataSource!

    override func setUpWithError() throws {
        characterDataSource = CharactersDataSource.shared
    }

    override func tearDownWithError() throws {
        characterDataSource = nil
    }
    
    func testGetAllCharacters() async throws {
        do {
            _ = try await characterDataSource.getCharacters()
        } catch {
            XCTAssertNil(error)
        }
    }

    func testGetCharacterByID() async throws {
        // Arrange
        let id = 1
        
        do {
            // Act
            let response = try await characterDataSource.getCharacter(by: "\(id)")
            
            // Assert
            XCTAssertEqual(response.id, id)
        } catch {
            // Assert Fail
            XCTFail(error.localizedDescription)
        }
    }
}
