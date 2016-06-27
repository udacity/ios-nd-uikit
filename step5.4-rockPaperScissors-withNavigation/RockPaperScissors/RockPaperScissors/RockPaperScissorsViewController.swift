//
//  RockPaperScissorsViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var match: RPSMatch!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //Notice that this code works for both Scissors and Paper
        let controller = segue.destinationViewController as! ResultViewController
        controller.match = self.match
    }

    @IBAction func makeYourMove(sender: UIButton) {
        
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.Rock)
            
        case self.paperButton:
            throwDown(RPS.Paper)

        case self.scissorsButton:
            throwDown(RPS.Scissors)
        
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    func throwDown(playersMove: RPS)
    {
        let computersMove = RPS()
        self.match = RPSMatch(playersMove, computersMove)
        
        //Here are the 3 ways of presenting a View Controller
        
        // 1st Way: Programmatic View Controller Presentation
        if (playersMove == RPS.Rock) {
            // Get the storyboard and ResultViewController
            let storyboard = UIStoryboard (name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController")as! ResultViewController
        
            // Communicate the match
            resultVC.match = self.match
            self.navigationController?.pushViewController(resultVC, animated: true)
        }
        
        // 2nd Way: Code plus Segue
        else if (playersMove == RPS.Paper) {
            performSegueWithIdentifier("throwDownPaper", sender: self)
        }
        
        // 3rd Way: Segue Only, No code!
        // But don't forget to implement prepareForSegue.
    }

}