//
//  NetworkResponseStatus.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

enum NetworkResponseStatus: Int {
    case SUCCESS = 200
    case UNAUTHORIZED = 401
    case NOT_FOUND = 404
    case SERVER_ERROR = 500
    case UNKNOWN
}
