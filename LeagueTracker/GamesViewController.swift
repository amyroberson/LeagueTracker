//
//  ViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit



class GamesViewController: UIViewController, UITableViewDelegate {

    
    var tableView: UITableView{
        return view as! UITableView
    }
    static let tableViewTag = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Games"
        tableView.delegate = self
        self.tableView.tag = GamesViewController.tableViewTag
        
        
    }




}

