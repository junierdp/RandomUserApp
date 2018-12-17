//
//  UserAPI.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/16/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation

class UserAPI {
    private var apiClient: RandomUserAPIClient
    init() {
        self.apiClient = RandomUserAPIClient()
    }
    
    typealias completionUserList<T:Codable> = (_ data: T?, _ error: String?) -> Void
    
    func getUserList(page: Int, limit: Int, whenLoaded: @escaping ([User]) -> Void, onError: @escaping (String) -> Void) {
        
        let completion: (UserList?, String?) -> Void = { users, error in
            if users != nil {
                whenLoaded((users?.list)!)
            } else {
                onError(error!)
            }
        }
        
        apiClient.request(
            route: RandomUserAPIRoutes.getUsers(page: page, limit: limit),
            completion: completion)
    }
}
