//
//  ViewController.swift
//  present_View
//
//  Created by Li Yin on 10/20/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func selectPhoto(sender: UIButton) {
        
       
        let nexController = UIAlertController()
        nexController.title = "test alert"
        nexController.message = "hi there"
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {action in self.dismissViewControllerAnimated(true, completion: nil)
        }
            
        nexController.addAction(okAction)
        
        self.presentViewController(nexController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

