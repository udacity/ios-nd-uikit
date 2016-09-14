//
//  ColorizerTextFieldDelegate.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ColorizerTextFieldDelegate: NSObject, UITextFieldDelegate

class ColorizerTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // MARK: Properties
    
    let colors: [String:UIColor] = [
        "red": UIColor.red,
        "orange":  UIColor.orange,
        "yellow":  UIColor.yellow,
        "green":  UIColor.green,
        "blue":  UIColor.blue,
        "brown":  UIColor.brown,
        "black":  UIColor.black,
        "purple":  UIColor.purple,
        "cyan" : UIColor.cyan,
        "magenta" : UIColor.magenta,
        "white" : UIColor.white
    ]
    
    /**
    * Examines the new string whenever the text changes. Finds color-words, blends them, and set the text color
    */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var colorsInTheText = [UIColor]()
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // For each dictionary entry in translations, pull out a string to search for
        
        for (key, color) in self.colors {
            
            if newText.range(of: key, options: .caseInsensitive).location != NSNotFound {
                colorsInTheText.append(color)
            }
        }
        
        // If we found any colors then blend them and set the text color
        
        if colorsInTheText.count > 0 {
            textField.textColor = self.blendColorArray(colorsInTheText)
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    /**
    * accepts an array of colors, and return a blend of all the elements
    */
    
    func blendColorArray(_ colors: [UIColor]) -> UIColor {
        var colorComponents: [CGFloat] = [CGFloat](repeating: 0.0, count: 4)
        
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
