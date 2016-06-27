//
//  ColorizerTextFieldDelegate.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ColorizerTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    
    let colors : [String : UIColor] = [
        "red": UIColor.redColor(),
        "orange":  UIColor.orangeColor(),
        "yellow":  UIColor.yellowColor(),
        "green":  UIColor.greenColor(),
        "blue":  UIColor.blueColor(),
        "brown":  UIColor.brownColor(),
        "black":  UIColor.blackColor(),
        "purple":  UIColor.purpleColor(),
        "cyan" : UIColor.cyanColor(),
        "magenta" : UIColor.magentaColor(),
        "white" : UIColor.whiteColor()
    ]
    
    /**
    * Examines the new string whenever the text changes. Finds color-words, blends them, and set the text color
    */
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var colorsInTheText = [UIColor]()
        var newText: NSString
        
        // Construct the text that will be in the field if this change is accepted
        newText = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // For each dictionary entry in translations, pull out a string to search for
        
        for (key, color) in self.colors {
            
            if newText.rangeOfString(key, options: NSStringCompareOptions.CaseInsensitiveSearch).location != NSNotFound {
                colorsInTheText.append(color)
            }
        }
        
        // If we found any colors then blend them and set the text color
        
        if colorsInTheText.count > 0 {
            textField.textColor = self.blendColorArray(colorsInTheText)
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    /**
    * accepts an array of colors, and return a blend of all the elements
    */
    
    func blendColorArray(colors: [UIColor]) -> UIColor {
        var colorComponents: [CGFloat] = [CGFloat](count: 4, repeatedValue: 0.0)
        
        for color in colors {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            colorComponents[0] += red
            colorComponents[1] += green
            colorComponents[2] += blue
            colorComponents[3] += alpha
        }

        for i in 0...colorComponents.count - 1 {
            colorComponents[i] /= CGFloat(colors.count)
        }
        
        return UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3])
    }
       
}















