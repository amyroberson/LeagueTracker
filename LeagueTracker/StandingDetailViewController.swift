//
//  StandingDetailViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/18/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class StandingDetailViewController: UIViewController{
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var gamesWonLabel: UILabel!
    @IBOutlet weak var gamesTiedLabel: UILabel!
    @IBOutlet weak var gamesLostLabel: UILabel!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let team = team{
            teamNameLabel.text = team.name
            gamesWonLabel.text = "Games Won: \(team.wins)"
            gamesTiedLabel.text = "Games Tied: \(team.draws)"
            gamesLostLabel.text = "Games Lost: \(team.losses)"
        }
    }
}
