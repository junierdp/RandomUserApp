//
//  UserListViewModel.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/15/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation
import RxSwift

class UserListViewModel: BaseViewModel {
    private let userAPI = UserAPI()
    
    let users = Variable<[UserViewModel]>([])
    var userLoaded: Observable<[UserViewModel]> {
        return self.users.asObservable()
    }
    
    private var currentPage: Int = 0
    
    override init() {
        super.init()
        self.getUserList()
    }
    
    func getUserList() {
        self.isLoading.value = true
        userAPI.getUserList(
            page: self.currentPage + 1,
            limit: 30,
            whenLoaded: { users in
                self.isLoading.value = false
                users.forEach({ user in
                    self.users.value.append(UserViewModel(user: user))
                })
                self.currentPage += 1
        },
            onError: { message in
                self.isLoading.value = false
                self.errorMessage.value = message
        })
    }
}
