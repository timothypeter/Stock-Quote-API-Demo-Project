//
//  StockObjectViewModel.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/25/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit

class StockObjectViewModel{
    var stockArray = [StockObject]()
    
    init(){
        retrieveData()
    }
    
    func retrieveData(){
        DataManager.sharedInstance.getStockQuotes()
        
        for element in DataManager.sharedInstance.quotesForStocks
        {
            if let stockObject = StockObject(name: element["name"] as! String, symbol: element["symbol"] as! String, lastTradePriceOnly: element["lastTradePriceOnly"] as! String, change: element["change"] as! String, yearLow: element["yearLow"] as! String, yearHigh: element["yearHigh"] as! String){
                self.stockArray.append(stockObject)
            }
        }
    }
}
