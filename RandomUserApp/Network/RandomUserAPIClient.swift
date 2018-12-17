//
//  RandomUserAPIClient.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/14/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation
import Alamofire

class RandomUserAPIClient {
    var manager: SessionManager?
    
    init() {
        self.manager = Alamofire.SessionManager.default
        self.manager?.session.configuration.timeoutIntervalForRequest = 60
        self.manager?.session.configuration.timeoutIntervalForResource = 60
    }
    
    typealias completion<T:Codable> = (_ data: T?, _ error: String?) -> Void
    func request<T:Codable>(route: RandomUserAPIRoutes, completion: @escaping completion<T>) {
        self.manager?.request(route).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success:
                let statusCode = (response.response?.statusCode)!
                switch statusCode {
                case 200..<209:
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data!)
                        completion(data, nil)
                    } catch let error {
                        completion(nil, "An error has occurred.")
                        print(error.localizedDescription)
                    }
                default:
                    do {
                        let data = try JSONDecoder().decode(ErrorMessage.self, from: response.data!)
                        completion(nil, data.error)
                    } catch let error {
                        completion(nil, "An error has occurred.")
                        print(error.localizedDescription)
                    }
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
