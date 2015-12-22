//
//  DetailViewController.swift
//  BondVillains
//
//  Created by Li Yin on 11/17/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var villain: Villain!
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.detailImageView!.image = UIImage(named: villain.imageName)
        self.detailLabel.text = self.villain.name
        
    }
    
}