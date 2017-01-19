//
//  GameDetailViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/18/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class GameDetailViewController: UIViewController {
   
    var game: Game?
    var gameStore: GameStore?
    var gameIndex: Int?
    
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func editGameButton(_ sender: UIBarButtonItem) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let editGameVC = storyBoard.instantiateViewController(withIdentifier: "EditGame") as! EditGameViewController
        editGameVC.dataSource = gameStore
        editGameVC.game = self.game
        editGameVC.gameIndex = self.gameIndex
        
        self.show(editGameVC, sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        team1Label.text = game?.team1.name
        team2Label.text = game?.team2.name
        scoreLabel.text = "\((game?.team1Score)!) - \((game?.team2Score)!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Game Stats"
        team1Label.text = game?.team1.name
        team2Label.text = game?.team2.name
        scoreLabel.text = "\((game?.team1Score) ?? 0) - \((game?.team2Score) ?? 0)"
    }
}
