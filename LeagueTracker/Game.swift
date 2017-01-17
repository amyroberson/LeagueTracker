//
//  Game.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Game: Equatable {
    var team1: Team
    var team2: Team
    var team1Score: Int
    var team2Score: Int
    var winner: Team? {
        if team1Score == team2Score {
            return nil
        } else if team1Score > team2Score {
            return team1
        } else {
            return team2
        }
    }
    
    init(team1: Team, team2 : Team, team1Score: Int, team2Score: Int){
        self.team1 = team1
        self.team2 = team2
        self.team1Score = team1Score
        self.team2Score = team2Score
    }
    
    convenience init?(dictionary: [String: Any]){
        if let team1Dictionary: [String: Any] = dictionary["team1"] as? [String: Any],
            let team2Dictionary: [String: Any] = dictionary["team2"] as? [String: Any],
            let team1: Team = Team(dictionary: team1Dictionary),
            let team2: Team = Team(dictionary: team2Dictionary){
                let team1Score: Int = dictionary["team1Score"] as? Int ?? 0
                let team2Score: Int = dictionary["team2Score"] as? Int ?? 0
                self.init(team1: team1, team2: team2, team1Score: team1Score, team2Score: team2Score)
        } else {
            return nil
        }
        
    }
    
    func setWinner(){
        if team1Score > team2Score{
            team1.numberOfWins += 1
        } else if team2Score > team1Score{
            team2.numberOfWins += 1
        }
    }
    
    
    
    func toDictionary() -> [String: Any] {
        let dictionary: [String: Any] = [
            "team1": self.team1.toDictionary(),
            "team2": self.team2.toDictionary(),
            "team1Score": self.team1Score,
            "team2Score": self.team2Score
            ]
        return dictionary
    }
    
    
    
    
 
    static func == (_ lhs: Game, _ rhs: Game) -> Bool{
        return lhs.team1 == rhs.team1 && rhs.team2 == lhs.team2
            && lhs.team1Score == rhs.team1Score && lhs.team2Score == rhs.team2Score
    }
}