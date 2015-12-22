//
//  ViewController.swift
//  Roshambo
//
//  Created by Li Yin on 10/20/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func randomAiResult () -> String {
        
        let array = ["paper", "rock", "scissors"]
        let randomResult = array [Int(arc4random() % 3)]
        
        return randomResult
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            if segue.identifier == "pressScissors" {
                let controller = segue.destinationViewController as! ResultViewController
                
                controller.aiPick = self.randomAiResult()
                controller.userPick = "scissors"
            
            }
        
            else if segue.identifier == "pressPaper" {
            
                let controller = segue.destinationViewController as! ResultViewController
                
                controller.aiPick = self.randomAiResult()
                controller.userPick = "paper"
            }
    }
    
    @IBAction func pressRock() {
        
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.aiPick = self.randomAiResult()
        controller.userPick = "rock"
        
        //self.presentViewController(controller, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func pressScissors () {
        
        performSegueWithIdentifier("pressScissors", sender: self)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

