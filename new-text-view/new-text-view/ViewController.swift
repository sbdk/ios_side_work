//
//  ViewController.swift
//  new-text-view
//
//  Created by Li Yin on 10/26/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {

    @IBOutlet weak var textField_1: UITextField!
    @IBOutlet weak var textField_2: UITextField!
    @IBOutlet weak var textField_3: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let lockAbleDelegate = LockAbleDelegate()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
       
        self.textField_1.delegate = zipCodeDelegate
        self.textField_3.delegate = lockAbleDelegate
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

