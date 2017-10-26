//
//  StockObject.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/20/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation

//A struct to represent stock information for a company
struct StockObject {
    var symbol: String
    var lastTradePriceOnly: String
    var change:String
    var yearLow:String
    var yearHigh:String
    

    init?(symbol: String, lastTradePriceOnly: String, change: String, yearLow: String, yearHigh: String){
       
        guard(!symbol.isEmpty), (!lastTradePriceOnly.isEmpty), (!change.isEmpty), (!yearLow.isEmpty), (!yearHigh.isEmpty) else{
            print("Failed")
            return nil
        }

        self.symbol = symbol
        self.lastTradePriceOnly = lastTradePriceOnly
        self.change = change
        self.yearLow = yearLow
        self.yearHigh = yearHigh
    }
}
