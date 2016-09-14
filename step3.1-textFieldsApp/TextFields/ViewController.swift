//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    // Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    
    // Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.isHidden = true
        
        // Set the three delegates
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
    }

    
    // Text Field Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text!
        newText = newText.replacingCharacters(in: range, with: string)
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.isHidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }
}

