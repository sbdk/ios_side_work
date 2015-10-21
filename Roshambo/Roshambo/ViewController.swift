//
//  ViewController.swift
//  Roshambo
//
//  Created by Li Yin on 10/20/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func randomAiResult () -> NSString {
        
        let array = ["paper", "rock", "scissors"]
        let randomResult = array [Int(arc4random() % 3)]
        
        return randomResult
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func pressRock() {
        
        var controller:ResultViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        controller.aiPick = self.randomAiResult() as String
        controller.userPick = "Rock"
        
        self.presentViewController(controller, animated: true, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

