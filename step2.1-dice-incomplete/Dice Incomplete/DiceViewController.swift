//  DiceViewController.swift
//  Dice
//
//  Created by Jason Schatz on 11/6/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit

class DiceViewController: UIViewController {
    
    var firstValue: Int?
    var secondValue: Int?
    
    @IBOutlet var firstDie: UIImageView!
    @IBOutlet var secondDie: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        
        // The dice will only appear if firstValue and secondValue have been set
        if let firstValue = self.firstValue {
            self.firstDie.image = UIImage(named: "d\(firstValue)")
        } else {
            self.firstDie.image = nil;
        }
        
        if let secondValue = self.secondValue {
            self.secondDie.image = UIImage(named: "d\(secondValue)")
        } else {
            self.secondDie.image = nil
        }
        
        self.firstDie.alpha = 0
        self.secondDie.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.3) {
            self.firstDie.alpha = 1
            self.secondDie.alpha = 1
        }
    }
    
    /**
    * accepts a conditional Int, and returns an dice image, or nil
    */
    
    func imageForValue(value: Int?) -> UIImage? {
        return nil
    }
    
    /**
    *    dismiss this view controller
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}


