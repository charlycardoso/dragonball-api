//
//  ServiceLayer.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import Foundation

@MainActor
final class ServiceLayer {

    static func callService<T: Decodable>(_ requestModel: RequestModel, _ modelType: T.Type) async throws -> T {
        
        var serviceURL = URLComponents(string: requestModel.getURL())
        
        if requestModel.method == .GET {
            serviceURL?.queryItems = buildQueryItems(params: requestModel.params ?? [:])
        }
        
        guard let componentURL = serviceURL?.url else {
            throw NetworkErrorHandler.InvalidURL
        }
        
        var request = URLRequest(url: componentURL)
        request.httpMethod = requestModel.method.rawValue
        
        if requestModel.method == .POST {
            do {
                let data = try JSONSerialization.data(withJSONObject: requestModel.body ?? [], options: .prettyPrinted)
                request.httpBody = data
            } catch {
                throw NetworkErrorHandler.InvalidBodyParameters
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let _ = response as? HTTPURLResponse else {
                throw NetworkErrorHandler.InvalidResponse
            }
            
            let decoder = JSONDecoder()
            
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            } catch {
                throw NetworkErrorHandler.CouldNotParseModel
            }
        } catch let error as NetworkErrorHandler {
            throw error
        }
    }
    
    private static func buildQueryItems(params: [String: Any]) -> [URLQueryItem] {
        let items = params.map({URLQueryItem(name: $0, value: $1 as? String ?? "empty")})
        return items
    }
}
