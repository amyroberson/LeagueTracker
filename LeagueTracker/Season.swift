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
    
    init(games: [Game]) {
        self.games = games
    }

    
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
    
    func setTeamRecords(games: [Game]){
        resetRecords()
        
        for game in games{
            if game.winner != nil {
                game.winner?.wins += 1
                game.loser?.losses += 1
            } else {
                game.team1.draws += 1
                game.team2.draws += 1
            }
        }
    }
    
    func resetRecords(){
        for team in teams{
            team.wins = 0
            team.losses = 0
            team.draws = 0
        }
    }
    
    
    func sortByRank() -> [Team] {
        setTeamRecords(games: self.games)
        var sortedTeams: [Team] = []
        sortedTeams = teams.sorted(by: ({$0.record > $1.record}))
        return sortedTeams
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
