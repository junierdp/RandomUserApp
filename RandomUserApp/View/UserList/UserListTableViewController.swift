//
//  UserListTableViewController.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/15/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UserListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var userListViewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = nil
        self.tableView.delegate = nil
        
        self.tableView.rowHeight = 130
        
        self.userListViewModel.filterUsers.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "userCell")) { _, user, cell in
            
            if let userCell = cell as? UserTableViewCell {
                userCell.userNameLabel.text = user.name
                userCell.userEmailLabel.text = user.email
                userCell.userPhoneLabel.text = user.phone
                userCell.userCellLabel.text = user.cell
            }
            
        }.disposed(by: self.userListViewModel.disposeBag)
        
        self.tableView.rx.modelSelected(UserViewModel.self).subscribe(onNext: { user in
            self.performSegue(withIdentifier: "goToUserDetail", sender: user)
            
        }).disposed(by: self.userListViewModel.disposeBag)
        
        self.tableView.rx.willDisplayCell.subscribe(onNext: { cell, indexPath in
            if indexPath.row == self.userListViewModel.users.value.count - 1 {
                self.userListViewModel.getUserList()
            }
        }).disposed(by: self.userListViewModel.disposeBag)
        
        self.searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
        .bind(to: self.userListViewModel.searchString)
        .disposed(by: self.userListViewModel.disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.userListViewModel.showLoadingIndicator.map({ isLoading in
            if isLoading {
                ActivityIndicator.sharedInstance.startActivityIndicator()
            } else {
                ActivityIndicator.sharedInstance.stopActivityIndicator()
            }
        }).subscribe().disposed(by: self.userListViewModel.disposeBag)
        
        self.userListViewModel.onError.map({ message in
            if !message.isEmpty {
                Utility.sharedInstance.alert("Oops!", message: message, alertAction: ["OK": .default], view: self)
            }
        }).subscribe().disposed(by: self.userListViewModel.disposeBag)
    }
}
