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
      
      // TODO: Implement method
      // 1. Dequeue a reusable cell from the table, using the correct “reuse identifier”
      // 2. Find the model object that corresponds to that row
      // 3. Set the images and labels in the cell with the data from the model object
      // 4. return the cell.
        
        let placeholderCell = UITableViewCell()
        return placeholderCell
    }
}

