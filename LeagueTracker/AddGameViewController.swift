//
//  AddGameViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class AddGameViewController: UIViewController, UITextFieldDelegate {
    var dataSource: GameStore?
    
    
    @IBAction func editButton(_ sender: UIButton) {
        
        if let name1 = team1TextField.text {
            if let name2 = team2TextField.text {
                let team1 = Team(name: name1, record: Record(wins: 0, draw: 0, loses: 0))
                let team2 = Team(name: name2, record: Record(wins: 0, draw: 0, loses: 0))
                let game = Game(team1: team1, team2: team2, team1Score: 0, team2Score: 0)
                self.dataSource?.games.append(game)
                if let vC = self.presentingViewController as? GamesViewController{
                    vC.tableView.reloadData()
                }
                do{
                    try dataSource?.saveGames()
                } catch {
                    print("Did not save")
                }
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var team1TextField: UITextField!
    @IBOutlet weak var team2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        team1TextField.delegate = self
        team2TextField.delegate = self
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
}
