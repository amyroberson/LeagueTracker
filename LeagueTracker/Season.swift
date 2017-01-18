//
//  Season.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Season {
    var games: [Game] = []
    
    var teams: Set<Team> {
        var teams: Set<Team> = []
        for game in self.games{
            teams.insert(game.team1)
            teams.insert(game.team2)
        }
        return teams
    }
    
    var records: [Team: Record] {
        var records: [Team : Record] = [:]
        for team in self.teams {
            records[team] = team.record
        }
        return records
    }
    
    init(games: [Game]){
        self.games = games
    }
    
    convenience init?(dictionary: [String: Any]) {
        if let gameDictionaries = dictionary["games"] as? [[String: Any]]{
            let theGames = gameDictionaries.map{Game(dictionary: $0)}
            if let games = theGames as? [Game] {
                if games.count != gameDictionaries.count {
                    return nil
                } else {
                    self.init(games: games)
                }
            }
        }
        return nil
    }
    
    func sortByRank() -> [Team] { //needs a test
        let teams = self.teams
        let rankedTeams = teams.sorted(by: {$0.record > $1.record})
        return rankedTeams
    }
    
    func toDictionary() -> [String : Any] {
        let dictionary: [String : Any] = [
            "games" : self.games.map {$0.toDictionary}
        ]
      
        return dictionary
    }
    
    
    
}
