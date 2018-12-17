//
//  RandomUserAPIRoutes.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/14/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation
import Alamofire

enum RandomUserAPIRoutes: URLRequestConvertible {
    case getUsers(page: Int, limit: Int)
    
    // Endpoint
    private var endpoint: String {
        switch self {
        case .getUsers:
            return "/"
        }
    }
    
    // Method
    private var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    // Parameter
    private var parameters: Parameters {
        switch self {
        case .getUsers(let page, let limit):
            return [
                "page": page,
                "results": limit
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        // Request endpoint
        let url: URL = try ("https://randomuser.me/api" + endpoint).asURL()
        var request = URLRequest(url: url)
        
        // Request method
        request.httpMethod = method.rawValue
        
        // Request parameters
        request = try URLEncoding.methodDependent.encode(request, with: parameters)
        
        return request
    }
}
