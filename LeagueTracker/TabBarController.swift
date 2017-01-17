//
//  TabBarController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, GameDataSourceDelegate, StandingDataSourceDelegate, GamesViewControllerDelegate, StandingViewControllerDelegate {

    let dataSource = GameStore()
    let gameData = GameDataSource()
    let standingData = StandingDataSource()
    let gamesViewController = GamesViewController()
    let standingViewController = StandingViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameData.delegate = self
        standingData.delegate = self
        gamesViewController.delegate = self
        standingViewController.delegate = self
    }

    
    

}
