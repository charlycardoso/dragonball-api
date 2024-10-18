//
//  RequestModel.swift
//  EpamTest
//
//  Created by Carlos Cardoso on 17/10/24.
//

import Foundation

struct RequestModel {

    private let url: String = BASE_URL
    let method: RequestMethod
    let endpoint: EndPoint
    var params: [String: Any]? = nil
    var urlData: [String]? = nil
    var body: Data? = nil

    func getURL() -> String {
        var url = self.url + endpoint.rawValue
        if let urlData = urlData {
            urlData.forEach { data in
                url.append("/\(data)")
            }
        }
        return url
    }
}
