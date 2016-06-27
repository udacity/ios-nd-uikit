//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Jason on 12/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class VillainDetailViewController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var villain: Villain!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.villain.name
  
        self.tabBarController?.tabBar.hidden = true
        
        self.imageView!.image = UIImage(named: villain.imageName)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
}
