//
//  CashTextFieldDelegate.swift
//  TextFieldChallengeApps
//
//  Created by Jason on 11/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        var newText = textField.text as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        var newTextString = String(newText)
        var digitText = ""
        var text: String
        
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) {
                digitText.append(c)
            }
        }
        
        // Format the new string
        if let fullValue = digitText.toInt() {
            newText = "$" + self.dollarStringFromInt(fullValue) + "." + self.centsStringFromInt(fullValue)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    func dollarStringFromInt(value: Int) -> String {
        return String(value / 100)
    }
    
    func centsStringFromInt(value: Int) -> String {
        
        let cents = value % 100
        var centsString = String(cents)
        
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }
}




























