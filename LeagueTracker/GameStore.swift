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
    
    var games: [Game] = []{
        didSet{
            for game in games{
                if !season.games.contains(game){
                    season.games.append(game)
                }
            }
        }
    }
    var season: Season
    
    init(games: [Game]){
        self.games = games
        self.season = Season(games: games)
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
        let jsonRepresentation = try JSONSerialization.data(withJSONObject: season.games.map{ $0.toDictionary() } , options: [])
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
        }
    }
    
}


