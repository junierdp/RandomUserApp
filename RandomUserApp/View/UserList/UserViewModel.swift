//
//  UserViewModel.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/16/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation

class UserViewModel {
    var name: String
    var firstName: String
    var lastName: String
    var phone: String
    var cell: String
    var email: String
    
    init(user: User) {
        self.name = "\(user.name?.title ?? "") \(user.name?.first ?? "") \(user.name?.last ?? "")".capitalized
        self.firstName = user.name?.first ?? ""
        self.lastName = user.name?.last ?? ""
        self.phone = user.phone ?? "N/A"
        self.cell = user.cell ?? "N/A"
        self.email = user.email ?? "N/A"
    }
}
