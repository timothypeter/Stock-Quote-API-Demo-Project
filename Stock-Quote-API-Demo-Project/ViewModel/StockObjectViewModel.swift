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
    var reloadTableViewCallback: (()->())!
    
    init(reloadTableViewCallback: @escaping ()->()){
        self.reloadTableViewCallback = reloadTableViewCallback
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name(Globals.kQuotesObtainedNotification), object: nil)
        
        //Begin retrieving data
        DataManager.sharedInstance.getStockQuotes()
    }
    
    @objc func methodOfReceivedNotification(notification: Notification){
        //Take Action on Notification
        retrieveData()
    }
    
    func retrieveData(){
        for element in DataManager.sharedInstance.quotesForStocks
        {
            var symbolString: String
            symbolString = element["symbol"] as? String ?? ""
        
            var tradePrice: String
            tradePrice = element["LastTradePriceOnly"] as? String ?? ""
            
            var change:String
            change = element["Change"] as? String ?? ""
            
            var yearLow:String
            yearLow = element["YearLow"] as? String ?? ""
            
            var yearHigh:String
            yearHigh = element["YearHigh"] as? String ?? ""
            
            if(!symbolString.isEmpty && !tradePrice.isEmpty && !change.isEmpty && !yearLow.isEmpty && !yearHigh.isEmpty){
                if let stockObject = StockObject(symbol: symbolString, lastTradePriceOnly: tradePrice, change: change, yearLow: yearLow, yearHigh: yearHigh){
                    self.stockArray.append(stockObject)
                }
            }
        }
        
        self.reloadTableViewCallback()
    }
}
