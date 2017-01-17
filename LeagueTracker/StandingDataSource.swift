//
//  StandingDataSource.swift
//  LeagueTracker
//
//  Created by Amy Roberson on 1/17/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit
protocol StandingDataSourceDelegate : NSObjectProtocol {
    
}

class StandingDataSource: NSObject, UITableViewDataSource {
    
    let teams: [Team] = []
    var delegate: StandingDataSourceDelegate?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StandingCell", for: indexPath)
        return cell
    }
}
