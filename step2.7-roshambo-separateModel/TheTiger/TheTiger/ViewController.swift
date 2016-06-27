//
//  ViewController.swift
//  TheTiger
//
//  Created by Jason Schatz on 12/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.startOver))
    }
    
    func startOver() {
        
        if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }

}

