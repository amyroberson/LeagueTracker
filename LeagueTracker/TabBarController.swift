//
//  TabBarController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, GameDataSourceDelegate, StandingDataSourceDelegate{

    var dataSource = GameStore()
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    let standingViewController = StandingViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for item in self.viewControllers!{
            if let controller = item as? UINavigationController{
                if let viewController = controller.topViewController as? GamesViewController{
                    viewController.tableView.dataSource = dataSource
                } else if let viewController = controller.topViewController as? StandingViewController{
                    viewController.tableView.dataSource = dataSource
                }
            }
        }
    }

    
    

}
