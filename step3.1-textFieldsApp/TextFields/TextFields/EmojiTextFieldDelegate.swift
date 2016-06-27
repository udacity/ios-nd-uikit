//
//  EmojiTextFieldDelegate.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    var translations = [String : String]()
    
    override init() {
        super.init()
        
        translations["heart"] = "\u{0001F496}"
        translations["fish"] = "\u{E522}"
        translations["bird"] = "\u{E523}"
        translations["frog"] = "\u{E531}"
        translations["bear"] = "\u{E527}"
        translations["dog"] = "\u{E052}"
        translations["cat"] = "\u{E04F}"
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var replacedAnEmoji = false
        var emojiStringRange: NSRange
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)

        // For each dictionary entry in translations, pull out a string to search for
        // and an emoji to replace it with
        
        for (emojiString, emoji) in translations {
        
            // Search for all occurances of key (ie. "dog"), and replace with emoji (ie. 🐶)
            repeat {
                emojiStringRange = newText.rangeOfString(emojiString, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
                // found one
                if emojiStringRange.location != NSNotFound {
                    newText = newText.stringByReplacingCharactersInRange(emojiStringRange, withString: emoji)
                    replacedAnEmoji = true
                }
                
            } while emojiStringRange.location != NSNotFound
        }

        // If we have replaced an emoji, then we directly edit the text field
        // Otherwise we allow the proposed edit.
        if replacedAnEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
}
