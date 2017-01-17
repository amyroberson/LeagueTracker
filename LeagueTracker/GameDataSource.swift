//
//  GameDataSource.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

protocol GameDataSourceDelegate : NSObjectProtocol {
    
}

class GameDataSource: NSObject, UITableViewDataSource {
    var games: [Game] = []
    var delegate: GameDataSourceDelegate?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        
        let game = games[indexPath.row]
        
        cell.textLabel?.text = "\(game.team1) vs. \(game.team2)"
        cell.detailTextLabel?.text = "\(game.team1Score) - \(game.team2Score)"
        
        
        return cell
        
    }
}
