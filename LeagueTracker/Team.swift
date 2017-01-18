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
    var record: Record
    var hashValue: Int {
        return name.hashValue + record.hashValue
    }
    
    init(name: String, record: Record){
        self.name = name
        self.record = record
    }
    
    convenience init?(dictionary: [String: Any]){
        if let name = dictionary["name"] as? String, let recordDictionary = dictionary["record"] as? [String: Any],
            let record = Record(dictionary: recordDictionary){
            self.init(name: name, record: record)
        } else {
            return nil
        }
    }
    
    func toDictionary() -> [String: Any] {
        let dictionary: [String: Any] = [
            "name" : self.name,
            "record" : self.record.toDictionary()
        ]
        return dictionary
    }
    
    static func == (_ lhs: Team, _ rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
}
