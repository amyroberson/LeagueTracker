//
//  StandingViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

protocol StandingViewControllerDelegate: NSObjectProtocol{
    
}

class StandingViewController: UIViewController, UITableViewDelegate {
    
    var delegate: StandingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Standings"
    }
    
    

}
