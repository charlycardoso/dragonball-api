//
//  NetworkErrorHandler.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import Foundation

enum NetworkErrorHandler: Error {
    case InvalidURL
    case CouldNotParseModel
    case InvalidBodyParameters
    case InvalidResponse
    case UnknownError
}

extension NetworkErrorHandler: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .InvalidURL:
            return NSLocalizedString("The URL is invalid", comment: "")
        case .CouldNotParseModel:
            return NSLocalizedString("Could not parse model", comment: "Check the model type")
        case .InvalidBodyParameters:
            return NSLocalizedString("Invalid body parameters", comment: "")
        case .InvalidResponse:
            return NSLocalizedString("Error server response", comment: "")
        case .UnknownError:
            return NSLocalizedString("Unknown error", comment: "")
        }
    }
}
