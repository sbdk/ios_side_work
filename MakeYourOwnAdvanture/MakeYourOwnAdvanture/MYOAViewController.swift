//
//  ViewController.swift
//  MakeYourOwnAdvanture
//
//  Created by Li Yin on 11/12/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//
import Foundation
import UIKit

class MYOAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "start over", style: UIBarButtonItemStyle.Plain, target: self, action: "startOver")
        
    }

    
    func startOver(){
        
        if let navigationController = self.navigationController{
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

