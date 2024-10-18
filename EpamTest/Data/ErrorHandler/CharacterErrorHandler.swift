//
//  CharacterErrorHandler.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import Foundation

enum CharacterErrorHandler: Error {
    case CHARACTER_NOT_FOUND
    case MODEL_PARSE_ERROR
    case NETWORK_ERROR
    case EMPTY_LIST
}

extension CharacterErrorHandler: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .CHARACTER_NOT_FOUND:
            return "Character not found"
        case .MODEL_PARSE_ERROR:
            return "Model parse error"
        case .NETWORK_ERROR:
            return "Network error"
        case .EMPTY_LIST:
            return "Characters list empty"
        }
    }
}
