//
//  UserViewModel.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/16/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation

class UserViewModel: NSObject {
    @objc var name: String
    @objc var firstName: String
    @objc var lastName: String
    @objc var phone: String
    @objc var cell: String
    @objc var email: String
    
    @objc var mediumImageURL: String
    @objc var largeImageURL: String
    
    @objc var street: String
    @objc var city: String
    @objc var state: String
    
    init(user: User) {
        self.name = "\(user.name?.title ?? "") \(user.name?.first ?? "") \(user.name?.last ?? "")".capitalized
        self.firstName = user.name?.first ?? ""
        self.lastName = user.name?.last ?? ""
        self.phone = user.phone ?? "N/A"
        self.cell = user.cell ?? "N/A"
        self.email = user.email ?? "N/A"
        
        self.mediumImageURL = (user.picture?.medium)!
        self.largeImageURL = (user.picture?.large)!
        
        self.street = (user.location?.street)!
        self.city = (user.location?.city)!
        self.state = (user.location?.state)!
    }
}
