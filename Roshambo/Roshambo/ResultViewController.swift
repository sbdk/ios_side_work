//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Li Yin on 10/20/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var aiPick: String!
    var userPick: String!
    
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
   
    func imageSize() {
        resultImage.frame = CGRectMake(200, 300, 200, 200)
    }
    
    override func viewWillAppear(animated: Bool) {
        //the result image will only show when airesult and userresult are received.
        
        
        
        if aiPick == "rock" {
            switch userPick {
                case "rock":
                    self.resultImage.image = UIImage(named: "itsATie")
                    self.resultLabel.text = "It's a tie"
            
                case "scissors":
                    self.resultImage.image = UIImage(named: "RockCrushesScissors")
                    self.resultLabel.text = "you lose"
                
                case "paper":
                    self.resultImage.image = UIImage(named: "PaperCoversRock")
                    self.resultLabel.text = "you win!"
                default: return
            }
        }
        
        else if aiPick == "scissors" {
            
            switch userPick {
            case "rock":
                self.resultImage.image = UIImage(named: "RockCrushesScissors")
                self.resultLabel.text = "you win!"
                
            case "scissors":
                self.resultImage.image = UIImage(named: "itsATie")
                self.resultLabel.text = "It's a tie"
                
            case "paper":
                self.resultImage.image = UIImage(named: "ScissorsCutPaper")
                self.resultLabel.text = "you lose"
            default: return
            }
        }
        
        else if aiPick == "paper" {
            
            switch userPick {
            case "rock":
                self.resultImage.image = UIImage(named: "PaperCoversRock")
                self.resultLabel.text = "you lose"
                
            case "scissors":
                self.resultImage.image = UIImage(named: "ScissorsCutPaper")
                self.resultLabel.text = "you win!"
                
            case "paper":
                self.resultImage.image = UIImage(named: "itsATie")
                self.resultLabel.text = "It's a tie"
            default: return
            }
        }
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        resultImage.contentMode = UIViewContentMode.ScaleAspectFit
        UIView.animateWithDuration(0.3) {
            self.resultImage.alpha = 1
        }
    }
    
    
    //dismiss this view controller

    @IBAction func playAgain() {
        
        if let navigationController = self.navigationController{
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
    
}
