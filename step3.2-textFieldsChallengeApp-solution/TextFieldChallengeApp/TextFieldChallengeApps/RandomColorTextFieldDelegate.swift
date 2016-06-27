//
//  RandomColorTextFieldDelegate.swift
//  TextFieldChallengeApps
//
//  Created by Jason on 11/13/14.
//  Copyright (c) 2014 Udacity. All rights reserved.

//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let colors = [UIColor.redColor(),
        UIColor.orangeColor(), UIColor.yellowColor(),
        UIColor.greenColor(), UIColor.blueColor(),
        UIColor.purpleColor(), UIColor.brownColor()];
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        
        return true
    }
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        return colors[randomIndex]
    }
}




























