//
//  VillainCollectionViewController.swift
//  BondVillains
//
//  Created by Gabrielle Miller-Messner on 2/3/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

import UIKit

class VillainCollectionViewController: UICollectionViewController {
 
    //TODO: Add outlet to flowLayout here.
    
    // Get ahold of some villains, for the table
    // This is an array of Villain instances
    let allVillains = Villain.allVillains
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Implement flowLayout here.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
    
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allVillains.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("VillainCollectionViewCell", forIndexPath: indexPath) as! VillainCollectionViewCell
        let villain = self.allVillains[indexPath.row]
        
        // Set the name and image
        cell.nameLabel.text = villain.name
        cell.villainImageView?.image = UIImage(named: villain.imageName)
        //cell.schemeLabel.text = "Scheme: \(villain.evilScheme)"
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath:NSIndexPath)
    {
        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("VillainDetailViewController") as! VillainDetailViewController
        detailController.villain = self.allVillains[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
}
