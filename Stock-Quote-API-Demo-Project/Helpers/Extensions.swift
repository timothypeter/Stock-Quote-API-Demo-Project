//
//  Extensions.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/25/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit

extension String{
    func changeToRedAfterColon() -> NSMutableAttributedString {
        //Need to make an array of strings that I can split into two, separated by :
        let newArrayOfStrings = self.components(separatedBy: ":")
        
        //Grab everything to the right of the :
        let attributedString2 = newArrayOfStrings[1]
        
        //Get the range of everything to the right of the colon
        let range = (self as NSString).range(of: attributedString2)
        
        //Create an attributed string so that we can change the color to red
        let attributedString = NSMutableAttributedString.init(string: self)
        attributedString.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.red], range: range)
        
        return attributedString
    }
    
    func changeToGreenAfterColon() -> NSMutableAttributedString {
        //Need to make an array of strings that I can split into two, separated by :
        let newArrayOfStrings = self.components(separatedBy: ":")
        
        //Grab everything to the right of the :
        let attributedString2 = newArrayOfStrings[1]
        
        //Get the range of everything to the right of the colon
        let range = (self as NSString).range(of: attributedString2)
        
        //Create an attributed string so that we can change the color to green
        let attribute = NSMutableAttributedString.init(string: self)
        attribute.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.green], range: range)
        
        return attribute
    }
}
