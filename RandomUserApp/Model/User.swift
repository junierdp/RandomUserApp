//
//  User.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/14/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation

struct UserList: Codable {
    var list: [User]?
    
    enum CodingKeys: String, CodingKey {
        case list = "results"
    }
}
struct User: Codable {
    var name: UserName?
    var gender: String?
    var email: String?
    var phone: String?
    var cell: String?
    var picture: UserPicture?
    var location: UserLocation?
    
    internal struct UserName: Codable {
        var title: String?
        var first: String?
        var last: String?
    }
    
    internal struct UserPicture: Codable {
        var large: String?
        var medium: String?
        var thumbnail: String?
    }
    
    internal struct UserLocation: Codable {
        var street: String?
        var city: String?
        var state: String?
        var postcode: Int?
    }
}




