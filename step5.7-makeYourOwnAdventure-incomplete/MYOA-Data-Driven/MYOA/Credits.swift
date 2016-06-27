//
//  Credits.swift
//  MYOA
//
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

struct Credits {
    
    var key: String?
    var title: String?
    var author: String?
    var source: String?
    var imageName: String?
    
    init(dictionary: [String : String]) {
        key = dictionary["key"] as String?
        title = dictionary["title"] as String?
        author = dictionary["author"] as String?
        source = dictionary["source"] as String?
        imageName = dictionary["image"] as String?
    }
}