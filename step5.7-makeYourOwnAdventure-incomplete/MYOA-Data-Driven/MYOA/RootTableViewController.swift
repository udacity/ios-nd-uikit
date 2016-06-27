//
//  RootTableViewController.swift
//  MYOA
//
//  Created by Jarrod Parkes on 11/3/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    var adventures = [Adventure]()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Initialize the Adventures
        let adventurePlistPaths = NSBundle.mainBundle().pathsForResourcesOfType("plist", inDirectory: nil) 
        
        for plistPath in adventurePlistPaths {
            
            if (plistPath as NSString).lastPathComponent != "Info.plist" {
                if let adventureDictionary = NSDictionary(contentsOfFile: plistPath) as? [String : AnyObject] {
                    adventures.append(Adventure(dictionary: adventureDictionary))
                }
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }

    // MARK: - UITableViewController
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell")!
        let adventure = adventures[indexPath.row]
        cell.textLabel!.text = adventure.credits.title
        cell.detailTextLabel!.text = adventure.credits.author
        let imageName = adventure.credits.imageName
        cell.imageView!.image = UIImage(named: imageName!)
                
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Get the selected adventure
        let selectedAdventure = adventures[indexPath.row]
        
        // Get the first node
        let firstNodeInTheAdventure = selectedAdventure.startNode

        // Get a StoryNodeController from the Storyboard
        let storyNodeController = self.storyboard!.instantiateViewControllerWithIdentifier("StoryNodeViewController")as! StoryNodeViewController
        
        // Set the story node so that we will see the start of the story
        storyNodeController.storyNode = firstNodeInTheAdventure
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(storyNodeController, animated: true)
    }
    
}

