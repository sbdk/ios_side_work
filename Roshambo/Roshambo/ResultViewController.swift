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
    
    var aiPick: String?
    var userPick: String?
    
    //@IBOutlet var firstDie: UIImageView!
    //@IBOutlet var secondDie: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        
    
    }
    
    override func viewDidAppear(animated: Bool) {
        
       
    }
    
    /**
    * accepts a conditional Int, and returns an dice image, or nil
    */
    
    func imageForValue(value: Int?) -> UIImage? {
        return nil
    }
    
    /**
    *    dismiss this view controller
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
