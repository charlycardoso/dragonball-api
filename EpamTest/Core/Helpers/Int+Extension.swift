//
//  Int+Extension.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

extension Int {
    var networkStatus: NetworkResponseStatus {
        switch self {
        case 200..<300: return .SUCCESS
        case 401: return .UNAUTHORIZED
        case 400..<500: return .NOT_FOUND
        case 500..<600: return .SERVER_ERROR
        default: return .UNKNOWN
        }
    }
}
