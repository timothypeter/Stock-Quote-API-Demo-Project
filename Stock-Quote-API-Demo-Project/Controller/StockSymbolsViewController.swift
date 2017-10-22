//
//  StockSymbolsViewController.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/19/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class StockSymbolsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    var stockSymbolsArray: [StockObject] = []
    var indexPathToPassForSegue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //stockSymbolsArray = [Any]()
        
        //Sending no params
        let dict = ["" : ""]
        
        var json = JSON.null
        
        //Call to retrieve Stock Quotes for various companies
        Alamofire.request(Router.getStockInfo(parameters: dict)).response {response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            
            //Print Data from response
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8){
                 print("Data: \(utf8Text)")
                
                //Grab the JSON out of the data we retrieved
                json = JSON(data: data)
                
                print(json)
                
                let dictFromJSON = json["query"].dictionaryValue
                
                if let resultsDict = dictFromJSON["results"]?.dictionaryValue{
                    let arrayOfQuotes = resultsDict["quote"]?.arrayValue
                    
                    for element in arrayOfQuotes!{
                        
                        //Initialize a stock object, and then place it into an array of stock objects to populate our table view with. Symbol and last trade price are the most important.
                        let symbol = element["symbol"].stringValue
                        let lastTradePriceOnly = element["LastTradePriceOnly"].stringValue
                        let change = element["Change"].stringValue
                        let yearLow = element["YearLow"].stringValue
                        let yearHigh = element["YearHigh"].stringValue
                        
                        //Initialize a stock object
                        let stockObject = StockObject(symbol: symbol, lastTradePriceOnly: lastTradePriceOnly)
                        stockObject.change = change
                        stockObject.yearLow = yearLow
                        stockObject.yearHigh = yearHigh

                        //Make a bool using the return from a function I wrote within stock object to test whether the init meets my requirements. It has to have a symbol and a lastTradePrice. Yahoo in particular sometimes doesn't have a symbol, so I realized I needed this test case.
                        let shouldAppendToArray = stockObject.verifySuccessfulInit()
                        
                        //There was a symbol and a lastTradePrice, go ahead and append it to the array
                        if(shouldAppendToArray){
                            self.stockSymbolsArray.append(stockObject)
                        }
                    }
                    
                    //Reload the tableView with new data after the call finishes
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Make sure the array has a count greater than zero, otherwise return default value of 1
        if(self.stockSymbolsArray.count > 0){
            return self.stockSymbolsArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //For this app we only want one section
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell", for: indexPath) as! StockTableViewCell
        
        if(self.stockSymbolsArray.count > 0){
            cell.symbolLabel.text = self.stockSymbolsArray[indexPath.row].symbol
            cell.lastTradePriceOnlyLabel.text = self.stockSymbolsArray[indexPath.row].lastTradePriceOnly
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SHOWDETAILSVIEWCONTROLLER", sender: self)
        indexPathToPassForSegue = indexPath.row
    }
    
    //MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SHOWDETAILSVIEWCONTROLLER"){
            if let viewController = segue.destination as? DetailsViewController {
                
                let stringForSymbol = "Symbol: " + stockSymbolsArray[indexPathToPassForSegue].symbol
                let lastTradePrice  = "Price: " + stockSymbolsArray[indexPathToPassForSegue].lastTradePriceOnly
                let change = "Change: " + stockSymbolsArray[indexPathToPassForSegue].change
                let yearLow = "Year Low: " + stockSymbolsArray[indexPathToPassForSegue].yearLow
                let yearHigh = "Year High: " + stockSymbolsArray[indexPathToPassForSegue].yearHigh
                
                viewController.arrayOfStringDataToShow.append(stringForSymbol)
                viewController.arrayOfStringDataToShow.append(lastTradePrice)
                viewController.arrayOfStringDataToShow.append(change)
                viewController.arrayOfStringDataToShow.append(yearLow)
                viewController.arrayOfStringDataToShow.append(yearHigh)
            }
        }
    }
}
