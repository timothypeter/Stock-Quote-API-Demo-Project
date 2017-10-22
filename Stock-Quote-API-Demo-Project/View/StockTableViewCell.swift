//
//  StockTableViewCell.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/21/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit

class StockTableViewCell: UITableViewCell{
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var lastTradePriceOnlyLabel: UILabel!
    
    func doLabelsHaveText() -> Bool{
        if((symbolLabel.text?.isEmpty)! || (lastTradePriceOnlyLabel.text?.isEmpty)!){
            return false
        }
        
        //Return true by default if neither string is empty
        return true
    }
}
