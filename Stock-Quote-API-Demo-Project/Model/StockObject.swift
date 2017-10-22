//
//  StockObject.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/20/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation

class StockObject: NSObject{
    var name: String = ""
    var symbol: String = ""
    var lastTradePriceOnly: String = ""
    var change:String = ""
    var yearLow:String = ""
    var yearHigh:String = ""
    
    init(symbol: String, lastTradePriceOnly: String){
        self.symbol = symbol
        self.lastTradePriceOnly = lastTradePriceOnly
    }
    
    public func verifySuccessfulInit() -> Bool{
        if(!self.symbol.isEmpty && !self.lastTradePriceOnly.isEmpty){
            return true
        }
        
        return false
    }
}
