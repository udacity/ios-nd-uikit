//
//  ViewController.swift
//  TextFieldChallengeApps
//
//  Created by Jason on 11/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    
    // MARK: Outlets
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField1.delegate = self.zipCodeDelegate
        self.textField2.delegate = self.cashDelegate
        self.textField3.delegate = self
        
        self.editingSwitch.setOn(false, animated: false)
    }
    
    // MARK: Text Field Delegate
    // Prevent editing when text field is already selected prior to toggling switch
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let isEditable = self.editingSwitch.isOn ? true : false
        return isEditable
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
 
    // MARK: Actions
    
    @IBAction func toggleTheTextEditor(_ sender: AnyObject) {
        
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
}
