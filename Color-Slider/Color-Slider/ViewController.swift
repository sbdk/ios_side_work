//
//  ViewController.swift
//  Color-Slider
//
//  Created by Li Yin on 10/17/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greedSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        colorView.layer.borderWidth = 1
        
        changeColor()
        
        
    }

    
    @IBAction func changeColor(){
        if self.redSlider == nil{
            return
        }
        let r: Float = redSlider.value
        let cgr: CGFloat = CGFloat(r)
        
        let g: Float = greedSlider.value
        let cgg: CGFloat = CGFloat(g)
        
        let b: Float = blueSlider.value
        let cgb: CGFloat = CGFloat(b)
        
        colorView.backgroundColor = UIColor(red: cgr, green: cgg, blue: cgb, alpha: 1)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

