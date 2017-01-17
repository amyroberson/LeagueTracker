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
    
    init(games: [Game]){
        self.games = games
    }
    
    func getTeams() -> [Team]{
        var teams: [Team] = []
        for game in self.games{
            teams.append(game.team1)
            teams.append(game.team2)
        }
        return teams
    }
    
    func sortByRank() -> [Team] {
        let teams = self.getTeams()
        let rankedTeams = teams.sorted(by: {$0.numberOfWins > $1.numberOfWins})
        return rankedTeams
    }
}
