//
//  BaseViewModel.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/16/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel {
    let disposeBag = DisposeBag()
    
    internal let isLoading = Variable(false)
    internal let errorMessage = Variable<String>("")
    internal let isSuccess = Variable(false)
    
    var showLoadingIndicator: Observable<Bool> {
        return self.isLoading.asObservable().distinctUntilChanged()
    }
    var onError: Observable<String> {
        return self.errorMessage.asObservable()
    }
    var onSuccess: Observable<Bool> {
        return self.isSuccess.asObservable().distinctUntilChanged()
    }
}
