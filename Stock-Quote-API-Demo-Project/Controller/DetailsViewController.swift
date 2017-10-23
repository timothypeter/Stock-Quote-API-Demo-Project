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
                //We want to split the string into two, and then make the color green since it's a positive change
                let attributedStringToPass = changeSecondHalfToGreen(stringToSplitAndColor: arrayOfStringDataToShow[indexPath.row])
                cell.textLabel?.attributedText = attributedStringToPass
            }
            
            if(arrayOfStringDataToShow[indexPath.row].contains("-")){
                //We want to split the string into two, and then make the color red since it's a negative change
                let attributedStringToPass = changeSecondHalfToRed(stringToSplitAndColor: arrayOfStringDataToShow[indexPath.row])
                cell.textLabel?.attributedText = attributedStringToPass
            }
            
            cell.textLabel?.text = arrayOfStringDataToShow[indexPath.row]
        }
        
        return cell
    }
}
