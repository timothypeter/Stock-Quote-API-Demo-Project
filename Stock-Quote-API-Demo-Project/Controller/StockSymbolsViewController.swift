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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //stockSymbolsArray = [Any]()
        
        //Makes us only look for open issues/pull requests
        let dict = ["state" : "open"]
        
        var json = JSON.null
        
        //Call to retrieve Stock Quotes for various companies
        Alamofire.request(Router.getStockInfo(parameters: dict)).response {response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Error: \(String(describing: response.error))")
            
            //Print Data from response
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8){
                // print("Data: \(utf8Text)")
                
                //Grab the JSON out of the data we retrieved
                json = JSON(data: data)
                
                print(json)
                
                let dictFromJSON = json["query"].dictionaryValue
                
                if let resultsDict = dictFromJSON["results"]?.dictionaryValue{
                    let arrayOfQuotes = resultsDict["quote"]?.arrayValue
                    
                    for element in arrayOfQuotes!{
                        
                        //Initialize a stock object, and then place it into an array of stock objects to populate our table view with
                        let stockObject = StockObject()
                        stockObject.symbol = element["symbol"].stringValue
                        stockObject.name = element["Name"].stringValue
                        stockObject.lastTradePriceOnly = element["LastTradePriceOnly"].stringValue
                        
                        if(!stockObject.symbol.isEmpty && !stockObject.lastTradePriceOnly.isEmpty){
                            //Insert the newly created stock object into an array
                            self.stockSymbolsArray.append(stockObject)
                        }
                    }
                    
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
}
