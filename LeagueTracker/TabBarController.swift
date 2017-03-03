//
//  TabBarController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{

    var dataSource = GameStore(games: [])
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    let standingViewController = StandingViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.fetchGames()
        for item in self.viewControllers!{
            if let controller = item as? UINavigationController{
                if let viewController = controller.topViewController as? GamesViewController{
                    viewController.gameStore = dataSource
                } else if let viewController = controller.topViewController as? StandingViewController{
                    viewController.gameStore = dataSource
                }
            }
        }
    }

    
    

}
