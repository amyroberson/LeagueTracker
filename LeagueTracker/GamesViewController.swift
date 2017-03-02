//
//  ViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit



class GamesViewController: UITableViewController{
    
    var gameStore: GameStore?
    var games: [Game] {
        if let games = gameStore?.games{
            return games
        } else {
            return []
        }
    }
    
    @IBAction func addGameButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addGameVC: AddGameViewController = storyBoard.instantiateViewController(withIdentifier: "AddGame") as! AddGameViewController
        addGameVC.dataSource = self.gameStore
        self.show(addGameVC, sender: nil)
    }
    static let tableViewTag = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Games"
        
        tableView.delegate = self
        self.tableView.tag = GamesViewController.tableViewTag
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gameDetailVC = storyBoard.instantiateViewController(withIdentifier: "GameDetail") as! GameDetailViewController
        gameDetailVC.gameStore = gameStore
        gameDetailVC.game = gameDetailVC.gameStore?.games[indexPath.row]
        gameDetailVC.gameIndex = indexPath.row
        self.show(gameDetailVC, sender: nil)
        
    }
}

extension GamesViewController {
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
        
        let game = games[indexPath.row]
        
        cell.textLabel?.text = "\(game.team1.name) vs. \(game.team2.name)"
        cell.detailTextLabel?.text = "\(game.team1Score) - \(game.team2Score)"
        
        
        return cell
        
    }
    
}

