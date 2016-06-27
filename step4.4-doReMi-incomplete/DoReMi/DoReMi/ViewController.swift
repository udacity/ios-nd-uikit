//
//  ViewController.swift
//  DoReMi
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource {

    // Use this string property as your reuse identifier, 
    // Storyboard has been set up for you using this String.
    let cellReuseIdentifier = "MyCellReuseIdentifier"
    
    // Choose some data to show in your table
    
    let model = [
        // TODO: Fill this array with data
    ]
    
    // Add the two essential table data source methods here
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Implement method to return the correct number of rows.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //TODO: Implement method to return cell with the correct reuseidentifier and populated with the correct data.
    }

}

