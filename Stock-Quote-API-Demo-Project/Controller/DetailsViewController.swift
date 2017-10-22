//
//  DetailsViewController.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/19/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var tableView: UITableView!
    
    var arrayOfStringDataToShow = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changeSecondHalfToRed(stringToSplitAndColor: String) -> NSMutableAttributedString {
        //Need to make an array of strings that I can split into two, separated by :
        let newArrayOfStrings = stringToSplitAndColor.components(separatedBy: ":")
        
        //Grab everything to the right of the :
        let attributedString2 = newArrayOfStrings[1]
        
        //Get the range of everything to the right of the colon
        let range = (stringToSplitAndColor as NSString).range(of: attributedString2)
        
        //Create an attributed string so that we can change the color to red
        let attributedString = NSMutableAttributedString.init(string: stringToSplitAndColor)
        attributedString.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.red], range: range)
        
        return attributedString
    }
    
    func changeSecondHalfToGreen(stringToSplitAndColor: String) -> NSMutableAttributedString {
        //Need to make an array of strings that I can split into two, separated by :
        let newArrayOfStrings = stringToSplitAndColor.components(separatedBy: ":")
        
        //Grab everything to the right of the :
        let attributedString2 = newArrayOfStrings[1]
        
        //Get the range of everything to the right of the colon
        let range = (stringToSplitAndColor as NSString).range(of: attributedString2)
        
        //Create an attributed string so that we can change the color to green
        let attribute = NSMutableAttributedString.init(string: stringToSplitAndColor)
        attribute.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.green], range: range)
        
        return attribute
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Make sure the array has a count greater than zero, otherwise return default value of 1

        if(arrayOfStringDataToShow.count > 0){
            return arrayOfStringDataToShow.count
        }

        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //For this app we only want one section
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if(arrayOfStringDataToShow.count > 0){
            if(arrayOfStringDataToShow[indexPath.row].contains("+")){
                //We want to split the string into two

                let attributedStringToPass = self.changeSecondHalfToGreen(stringToSplitAndColor: arrayOfStringDataToShow[indexPath.row])
                cell.textLabel?.attributedText = attributedStringToPass
            }
            
            if(arrayOfStringDataToShow[indexPath.row].contains("-")){
                let attributedStringToPass = self.changeSecondHalfToRed(stringToSplitAndColor: arrayOfStringDataToShow[indexPath.row])
                cell.textLabel?.attributedText = attributedStringToPass
            }
            
            cell.textLabel?.text = arrayOfStringDataToShow[indexPath.row]
        }
        
        return cell
    }
}
