//
//  ZipCodeDelegate.swift
//  new-text-view
//
//  Created by Li Yin on 10/27/15.
//  Copyright © 2015 Li Yin. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = NSCharacterSet(charactersInString: matchCharacters).invertedSet
        return self.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
    }
}

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
   
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if prospectiveText.containsOnlyCharactersIn("0123456789") &&
            prospectiveText.characters.count <= 5 {
        
        return true
        }
        
        return false
    }
    
    
    
    
    
}