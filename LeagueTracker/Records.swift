//
//  Records.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/18/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

struct Record: Hashable {
    var wins: Int
    var loses: Int
    var draw: Int
    
    init(wins: Int, draw: Int, loses: Int){
        self.wins = wins
        self.draw = draw
        self.loses = loses
    }
    
    init?(dictionary: [String: Any]) {
        if let wins = dictionary["wins"] as? Int,
            let loses = dictionary["loses"] as? Int,
            let draw = dictionary["draw"] as? Int {
            self.init(wins: wins, draw: draw, loses: loses)
        } else {
            return nil
        }
    }
    
    var hashValue: Int {
        return wins.hashValue + draw.hashValue + loses.hashValue
    }
    
    static func > (_ lhs: Record, _ rhs: Record) -> Bool {
        if lhs.wins > rhs.wins{
            return true
        } else if lhs.wins == rhs.wins && lhs.loses <= rhs.loses{
            return lhs.draw >= rhs.draw
        } else {
            return false
        }
    }
    
    static func == (_ lhs: Record, _ rhs: Record) -> Bool {
        return lhs.wins == rhs.wins &&
                lhs.loses == rhs.loses &&
                lhs.draw == rhs.draw
    }
    
    func toDictionary() -> [String: Any] {
        let dictionary: [String: Any] = [
            "wins" : self.wins,
            "loses" : self.loses,
            "draw" : self.draw
        ]
        return dictionary
    }

}
