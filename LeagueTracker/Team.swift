//
//  Team.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class Team: Hashable {
    var name: String
    
    var wins = 0
    var draws = 0
    var losses = 0
    var hashValue: Int {
        return name.hashValue
    }
    var record: (Int,Int,Int) {
        return (wins,draws,losses)
    }
    
    
    init(name: String){
        self.name = name
    }
    
    convenience init?(dictionary: [String: Any]){
        if let name = dictionary["name"] as? String{
            self.init(name: name)
        } else {
            return nil
        }
    }
    
    func toDictionary() -> [String: Any] {
        
        
        let dictionary: [String: Any] = [
            "name" : self.name,
        ]
        return dictionary
    }
    
    static func == (_ lhs: Team, _ rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
}
