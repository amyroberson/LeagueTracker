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
    var teams: Set<Team> = []
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func editButton(_ sender: UIButton) {
        
        if let name1 = team1TextField.text?.trimmingCharacters(in: .whitespaces) {
            if let name2 = team2TextField.text?.trimmingCharacters(in: .whitespaces) {
                var team1: Team? = nil
                var team2: Team? = nil
                if name1 != name2{
                    for team in teams{
                        if team.name == name1{
                            team1 = team
                        } else if team.name == name2{
                            team2 = team
                        }
                    }
                    if team1 == nil {
                        team1 = Team(name: name1)
                    }
                    if team2 == nil {
                        team2 = Team(name: name2)
                    }
                    let game = Game(team1: team1!, team2: team2!, team1Score: 0, team2Score: 0)
                    self.dataSource?.season.games.append(game)
                    do{
                        try dataSource?.saveGames()
                    } catch {
                        print("Did not save")
                    }
                    
                    
                    errorLabel.isHidden = true
                    let arrayCount: Int = Int((navigationController?.viewControllers.count)!)
                    if arrayCount >= 2 {
                        let uiVC: UIViewController = (navigationController?.viewControllers[arrayCount - 2])!
                        let _ = self.navigationController?.popToViewController(uiVC, animated: true)
                    }
                    
                }
                errorLabel.isHidden = false
            }
        }
    }
    
    @IBOutlet weak var team1TextField: UITextField!
    @IBOutlet weak var team2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1TextField.delegate = self
        team2TextField.delegate = self
        if let season = dataSource?.season{
            teams = Set(season.sortByRank())
        }
        errorLabel.isHidden = true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
