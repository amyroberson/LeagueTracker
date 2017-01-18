//
//  EditGameViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit
//connect outlets and actions
// add text to textfields
//save changed data
class EditGameViewController: UIViewController, UITextFieldDelegate{
    
    var game: Game?
    var gameIndex: Int?
    var dataSource: GameStore?
    
    @IBOutlet weak var team1TextField: UITextField!
    @IBOutlet weak var team1ScoreTextField: UITextField!
    @IBOutlet weak var team2TextField: UITextField!
    @IBOutlet weak var team2ScoreTextField: UITextField!
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func editButton(_ sender: UIButton) {
        if let name1 = team1TextField.text,
            let name2 = team2TextField.text,
            let name1Score: Int = Int((team1ScoreTextField.text)!),
            let name2Score: Int = Int((team2ScoreTextField.text)!),
            let thisGame = game,
            let index = gameIndex{
            thisGame.team1.name = name1
            thisGame.team2.name = name2
            thisGame.team1Score = name1Score
            thisGame.team2Score = name2Score
            dataSource?.games[index] = thisGame
            do{
                try dataSource?.saveGames()
            } catch {
                print("Failed to save")
            }
            self.dismiss(animated: true, completion: nil)
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1TextField.delegate = self
        team1ScoreTextField.delegate = self
        team2TextField.delegate = self
        team2ScoreTextField.delegate = self
        team1TextField.text = game?.team1.name
        team2TextField.text = game?.team2.name
        if let editingGame = game {
            team1ScoreTextField.text = "\(editingGame.team1Score)"
            team2ScoreTextField.text = "\(editingGame.team2Score)"
        }
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false{
            textField.resignFirstResponder()
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false{
            textField.resignFirstResponder()
            return true
        }
        return false
    }
}
