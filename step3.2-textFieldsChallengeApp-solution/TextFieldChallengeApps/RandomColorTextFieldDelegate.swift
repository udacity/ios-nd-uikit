//
//  RandomColorTextFieldDelegate.swift
//  TextFieldChallengeApps
//
//  Created by Jason on 11/13/14.
//  Copyright (c) 2014 Udacity. All rights reserved.

//

import Foundation
import UIKit

// MARK: - RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let colors = [UIColor.red,
        UIColor.orange, UIColor.yellow,
        UIColor.green, UIColor.blue,
        UIColor.purple, UIColor.brown];
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        
        return true
    }
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        return colors[randomIndex]
    }
}
