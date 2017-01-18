//
//  GameStore.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

enum GameResults: Error{
    case success([Game])
    case fail
}

enum FileError: Error{
    case noSupportDirectory
    case failedToWrite
    case failedToRead
}

final class GameStore: NSObject {
    
    var games: [Game] = []
    //[Game(team1: Team(name:"Jets", numberOfWins:3), team2: Team(name:"Tigers", numberOfWins: 2), team1Score: 4, team2Score: 7), Game(team1: Team(name:"Cats", numberOfWins:3), team2: Team(name:"Raiders", numberOfWins: 2), team1Score: 4, team2Score: 7)]
    var season: Season {
        return Season(games: games)
    }
    
    func getGamesFilePath() throws -> URL {
        guard let supportDir = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else{
            throw FileError.noSupportDirectory
        }
        var supportFile = supportDir.appendingPathComponent("Games")
        try FileManager.default.createDirectory(at: supportFile, withIntermediateDirectories: true, attributes: nil)
        supportFile = supportFile.appendingPathComponent("Game")
        return supportFile
    }
    
    // not sure about the do catches here
    func fetchGames() {
        do {
            let file = try getGamesFilePath()
            if FileManager.default.fileExists(atPath: file.path) {
                do{
                    let tmp = try readJson(json: try Data(contentsOf: file))
                    games = tmp
                
                } catch {
                    
                    print("Error in Fetch")
                }
            }
        } catch {
            print("Error in Fetch")
        }
    }
    
    func saveGames() throws{
        let gamesToSave = try self.toJson()
        do {
            let file = try getGamesFilePath()
            try gamesToSave.write(to: file)
            
        } catch {
            throw FileError.failedToWrite
        }
    }
    
    func toJson() throws -> Data{
        let jsonRepresentation = try JSONSerialization.data(withJSONObject: games.map{ $0.toDictionary() } , options: [])
        return jsonRepresentation
    }
    
    func readJson(json: Data) throws -> [Game] {
        do {
            guard let jsonObject = try JSONSerialization.jsonObject(with: json, options: []) as? [[String : Any]] else {
                return []
            }
            if let tmp = jsonObject.map({ Game(dictionary: $0) }) as? [Game] {
                return tmp
                
            } else {
                return []
            }
            
        } catch {
            throw FileError.failedToRead
            // so once this is thrown what happens when running my code
        }
    }
    
}

extension GameStore: UITableViewDataSource {
    var teams: [Team] {
        return season.sortByRank()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == GamesViewController.tableViewTag {
            return games.count
        } else if tableView.tag == StandingViewController.tableViewTag {
            return teams.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == GamesViewController.tableViewTag {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
            
            let game = games[indexPath.row]
            
            cell.textLabel?.text = "\(game.team1.name) vs. \(game.team2.name)"
            cell.detailTextLabel?.text = "\(game.team1Score) - \(game.team2Score)"
            
            
            return cell
        } else if tableView.tag == StandingViewController.tableViewTag {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StandingCell", for: indexPath)
            cell.textLabel?.text = "\(teams[indexPath.row].name)"
            cell.detailTextLabel?.text = "Number Of Wins: \(teams[indexPath.row].record.wins)"
            return cell
        }
        
        
        return UITableViewCell()
    }
}
