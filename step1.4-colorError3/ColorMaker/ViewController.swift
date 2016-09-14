//
//  ViewController.swift
//  ColorMaker
//
//  Created by Jason Schatz on 11/2/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redControl: UISwitch!
    @IBOutlet weak var greenControl: UISwitch!
    @IBOutlet weak var blueControl: UISwitch!

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Actions
    
    @IBAction func changeColorComponent(_ sender: AnyObject) {
        
        let r: CGFloat = self.redControl.isOn ? 1 : 0
        let g: CGFloat = self.greenControl.isOn ? 1 : 0
        let b: CGFloat = self.blueControl.isOn ? 1 : 0
                
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

