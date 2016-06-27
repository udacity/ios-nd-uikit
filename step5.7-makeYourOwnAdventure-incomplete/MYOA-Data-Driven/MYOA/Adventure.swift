//
//  Story.swift
//  MYOA
//
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

class Adventure {
    
    var credits: Credits;
    var startNode: StoryNode!
    
    var storyNodes: [String : StoryNode]
    
    init(dictionary: [String : AnyObject]) {
        
        // Get the two dictionaries
        let creditsDictionary = dictionary["credits"] as! [String : String]
        let storyNodesDictionary = dictionary["nodes"] as! [String : AnyObject]
        
        // Create the credits
        credits = Credits(dictionary: creditsDictionary)
        
        // Create the nodes array
        storyNodes = [String : StoryNode]()
        
        // Add a Story Node for each item in storyNodesDictionary
        for (key, dictionary): (String, AnyObject) in storyNodesDictionary {
            storyNodes[key] = StoryNode(dictionary: dictionary as! [String : AnyObject], adventure: self)
        }
        
        
        // Set the first node
        let startNodeKey = dictionary["startNodeKey"]as! String
        startNode = storyNodes[startNodeKey]!
    }
}
