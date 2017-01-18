//
//  RecordsTests.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/18/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import LeagueTracker

class RecordsTests: XCTestCase {
    
    func testInits(){
        let record1 = Record(wins: 1, draw: 2, loses: 3)
        let this: [String: Any] = [
            "wins" : 1,
            "loses" : 3,
            "draw" : 2
        ]
        let record2 = Record(dictionary: this)
        XCTAssertEqual(record1, record2!)
    }
    
    func testToDictionary(){
        let record = Record(wins: 1, draw: 2, loses: 3)
        let dictionary = record.toDictionary()
        if let wins = dictionary["wins"] as? Int,
            let loses = dictionary["loses"] as? Int,
            let draw = dictionary["draw"] as? Int{
            XCTAssertEqual(record.wins, wins)
            XCTAssertEqual(record.loses, loses)
            XCTAssertEqual(record.draw, draw)
        }
    }
    
    func testSort(){
        let record1 = Record(wins: 3, draw: 2, loses: 3)
        let record2 = Record(wins: 2, draw: 2, loses: 3)
        XCTAssertTrue(record1 > record2)
        let record3 = Record(wins: 1, draw: 2, loses: 3)
        let record4 = Record(wins: 2, draw: 2, loses: 3)
        XCTAssertFalse(record3 > record4)
        let recordA = Record(wins: 2, draw: 3, loses: 3)
        let recordB = Record(wins: 2, draw: 2, loses: 3)
        XCTAssertTrue(recordA > recordB)
        let recordC = Record(wins: 2, draw: 2, loses: 2)
        let recordE = Record(wins: 2, draw: 2, loses: 3)
        XCTAssertTrue(recordC > recordE)
    }
    
}
