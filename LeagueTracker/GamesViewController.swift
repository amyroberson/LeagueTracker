//
//  ViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

protocol GamesViewControllerDelegate: NSObjectProtocol{
    
}

class GamesViewController: UIViewController, UITableViewDelegate {

    var delegate: GamesViewControllerDelegate?
    var tableView: UITableView {
        return view as! UITableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = self.delegate
        
        title = "Games"
        tableView.delegate = self
        tableView.dataSource = dataSource.gameData
    }




}

