//
//  Season.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Season: Equatable {
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
    
    init(games: [Game]) {
        self.games = games
    }
    
//    convenience init?(dictionary: [String: Any]) {
//        if let gameDictionaries = dictionary["games"] as? [[String: Any]],
//            let games = { () -> [Game]? in gameDictionaries.flatMap{Game(dictionary: $0)} }(), games.count == gameDictionaries.count {
//            self.init(games: games)
//        } else {
//            return nil
//        }
//    }
    
    convenience init?(dictionary: [String: Any]) {
        if let gameDictionaries = dictionary["games"] as? [[String: Any]]{
            let theGames = gameDictionaries.map{Game(dictionary: $0)}
            if let games = theGames as? [Game] {
                self.init(games: games)
                return
            }
        }
        return nil
    }
    
    func sortByRank() -> [Team] { 
        let teams = self.teams
        let rankedTeams = teams.sorted(by: {$0.record > $1.record})
        return rankedTeams
    }
    
    func toDictionary() -> [String : Any] {
        let dictionary: [String : Any] = [
            "games" : self.games.map { $0.toDictionary() }
        ]
      
        return dictionary
    }
    
    static func == (_ lhs: Season, _ rhs: Season) -> Bool{
        return lhs.games == rhs.games
    }
    
}
