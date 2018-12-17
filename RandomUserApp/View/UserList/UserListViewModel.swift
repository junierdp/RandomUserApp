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
    let filterUsers = Variable<[UserViewModel]>([])
    var userLoaded: Observable<[UserViewModel]> {
        return self.users.asObservable()
    }
    
    var searchString = Variable<String>("")
    
    private var currentPage: Int = 0
    
    override init() {
        super.init()
        self.getUserList()
        
        self.searchString.asObservable().subscribe(onNext: { stringValue in
            self.userLoaded.map({ $0.filter({
                if stringValue.isEmpty { return true}
                
                return $0.lastName.lowercased().contains(stringValue.lowercased())
            })
                
            }).bind(to: self.filterUsers)
            .disposed(by: self.disposeBag)
        }).disposed(by: self.disposeBag)
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
                self.users.value.sort(by: { $0.lastName < $1.lastName })
        },
            onError: { message in
                self.isLoading.value = false
                self.errorMessage.value = message
        })
    }
}
