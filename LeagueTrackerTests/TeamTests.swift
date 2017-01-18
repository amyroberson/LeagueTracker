//
//  TeamTests.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import LeagueTracker

class TeamTests: XCTestCase {
    
    func testINITS(){
        let team1 = Team(name: "Tigers", record: Record(wins: 1, draw: 1, loses: 1))
        let dictionary = team1.toDictionary()
        let team2 = Team(dictionary: dictionary)
        XCTAssertEqual(team1, team2!)
    }
    
}
