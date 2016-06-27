
//
//  Connection.swift
//  MYOA
//
//  Created by Jason on 1/17/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

struct Connection {
    
    var prompt: String
    var connectToStoryNodeNamed: String
    
    init(dictionary: [String : String]) {
        prompt = dictionary["prompt"]!
        connectToStoryNodeNamed = dictionary["connectTo"]!
    }
}
