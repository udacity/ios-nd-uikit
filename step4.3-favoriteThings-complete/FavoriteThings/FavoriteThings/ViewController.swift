//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    // Model
    
    let favoriteThings = [
        "Raindrops on roses",
        "Whiskers on kittens",
        "Bright copper kettles",
        "Warm woolen mittens"
    ]

    // Mark: Table View Data Source Methods
    
    /**
    * Number of Rows
    */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.favoriteThings.count
    }

    /**
    * Cell For Row At Index Path
    */

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteThingCell")!
        let favoriteThingForRow = self.favoriteThings[indexPath.row]
        cell.textLabel?.text = favoriteThingForRow
        
        return cell

    }
}

