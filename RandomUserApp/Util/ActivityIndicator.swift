//
//  ActivityIndicator.swift
//  RandomUserApp
//
//  Created by Junier Damian on 12/16/18.
//  Copyright © 2018 JunierOniel. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class ActivityIndicator {
    let view: UIView = UIView()
    let activityIndicator = MDCActivityIndicator()
    let window = UIApplication.shared.keyWindow!
    
    static let sharedInstance = ActivityIndicator()
    
    func startActivityIndicator() {
        self.view.frame = window.frame
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.activityIndicator.sizeToFit()
        self.activityIndicator.radius = 30
        self.activityIndicator.strokeWidth = 5
        self.activityIndicator.center = self.view.center
        self.activityIndicator.cycleColors = [UIColor.init(red: 250/255, green: 182/255, blue: 80/255, alpha: 1)]
        self.view.addSubview(self.activityIndicator)
        
        window.addSubview(self.view)
        
        self.activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.view.removeFromSuperview()
    }
}

