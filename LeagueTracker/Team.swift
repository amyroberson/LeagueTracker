//
//  Team.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class Team: Equatable {
    let name: String
    var numberOfWins: Int
    
    init(name: String, numberOfWins: Int){
        self.name = name
        self.numberOfWins = numberOfWins
    }
    
    convenience init?(dictionary: [String: Any]){
        if let name = dictionary["name"] as? String, let numberOfWins = dictionary["numberOfWins"] as? Int {
            self.init(name: name, numberOfWins: numberOfWins)
        } else {
            return nil
        }
    }
    
    func toDictionary() -> [String: Any] {
        let dictionary: [String: Any] = [
            "name" : self.name,
            "numberOfWins" : self.numberOfWins
        ]
        return dictionary
    }
    
    static func == (_ lhs: Team, _ rhs: Team) -> Bool {
        return lhs.name == rhs.name && lhs.numberOfWins == rhs.numberOfWins
    }
}
