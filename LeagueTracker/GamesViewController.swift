//
//  ViewController.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit



class GamesViewController: UIViewController, UITableViewDelegate {

    
    
    @IBAction func addGameButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let addGameVC: AddGameViewController = storyBoard.instantiateViewController(withIdentifier: "AddGame") as! AddGameViewController
        addGameVC.dataSource = self.tableView.dataSource as! GameStore?
        self.present(addGameVC, animated: true, completion: nil)
       
    }
    var tableView: UITableView{
        return view as! UITableView
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let editGameVC: EditGameViewController = storyBoard.instantiateViewController(withIdentifier: "EditGame") as! EditGameViewController
        editGameVC.dataSource = tableView.dataSource as! GameStore?
        editGameVC.game = editGameVC.dataSource?.games[indexPath.row]
        self.present(editGameVC, animated: true, completion: nil)
    }


}

