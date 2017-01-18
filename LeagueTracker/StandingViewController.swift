//
//  StandingViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit


class StandingViewController: UITableViewController {
    
    var gameStore: GameStore?
    var teams: [Team] {
        if let season = gameStore?.season{
            return season.sortByRank()
        } else {
            return []
        }
    }
    
    static let tableViewTag = 2
    
    
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

extension StandingViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandingCell", for: indexPath)
        cell.textLabel?.text = "\(teams[indexPath.row].name)"
        cell.detailTextLabel?.text = "Number Of Wins: \(teams[indexPath.row].record.wins)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let standingDetailVC = storyboard.instantiateViewController(withIdentifier: "StandingDetail") as! StandingDetailViewController
        standingDetailVC.team = teams[indexPath.row]
        self.show(standingDetailVC, sender: nil)
    }
    
}
