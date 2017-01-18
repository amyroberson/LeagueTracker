//
//  StandingViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit


class StandingViewController: UIViewController, UITableViewDelegate {
    
    
    
    static let tableViewTag = 2
    
    var tableView: UITableView{
        return view as! UITableView
    }
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Standings"
        tableView.delegate = self
        self.tableView.tag = StandingViewController.tableViewTag
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    

}
