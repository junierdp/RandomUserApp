//
//  Utitlity.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/16/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    static let sharedInstance = Utility()
    
    func alert(_ title: String, message: String, alertAction: [String: UIAlertAction.Style], view: UIViewController, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for (title, action) in alertAction {
            alertController.addAction(UIAlertAction.init(title: title, style: action, handler: handler))
        }
        
        view.present(alertController, animated:true, completion: nil)
    }
}
