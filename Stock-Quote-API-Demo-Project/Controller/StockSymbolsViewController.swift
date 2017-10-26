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
    var stockObjectViewModel: StockObjectViewModel!
  
    //method is called by the viewModel when it has new data
    func reloadTableViewData(){
        DispatchQueue.main.async{
            self.stockSymbolsArray = self.stockObjectViewModel.stockArray
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stockObjectViewModel = StockObjectViewModel(reloadTableViewCallback: reloadTableViewData)
        
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
                
                if let responseCode = response.response?.statusCode{
                    //The same call, with the same data sometimes randomly fails. This was a little last minute, because I wasn't having any problems with the calls until tonight (Sunday, 10/23). However, a restart of the app/running the call again usually does the trick. The problem is server side.
                    if(responseCode != 200){
                        print("Call to server failed.")
                        
                        let alertController = UIAlertController(title: "Error", message: "Call to retrieve data failed. Please restart the app.", preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                        return
                    }
                    
                    //Grab the JSON out of the data we retrieved
                    json = JSON(data: data)
                    
                    print(json)
                    
                    //Get everything in the json under "query"
                    let dictFromJSON = json["query"].dictionaryValue
                    
                    //Have to now specify that we want the "results"
                    if let resultsDict = dictFromJSON["results"]?.dictionaryValue{
                        
                        //now we can actually get the array of quotes. With SwiftyJSON you have to break it down into a few steps.
                        let arrayOfQuotes = resultsDict["quote"]?.arrayValue
                        
                        //Iterate through our of array quotes. Create stock objects to place into an array, and then update the tableView when we are done
                        for element in arrayOfQuotes!{
                            //Initialize a stock object, and then place it into an array of stock objects to populate our table view with. Symbol and last trade price are the most important.
                            let symbol = element["symbol"].stringValue
                            let lastTradePriceOnly = element["LastTradePriceOnly"].stringValue
                            let change = element["Change"].stringValue
                            let yearLow = element["YearLow"].stringValue
                            let yearHigh = element["YearHigh"].stringValue
                            
                            //Initialize a stock object
                            if let stockObject = StockObject.init(symbol: symbol, lastTradePriceOnly: lastTradePriceOnly, change: change, yearLow: yearLow, yearHigh: yearHigh){
                                 self.stockSymbolsArray.append(stockObject)
                            }
                        }
                        
                        //Reload the tableView with new data after the call finishes
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: TableView Delegate Methods
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
        
        //Check if the array of symbols has a count greater than zero to avoid crashes, and then access it to set the text of the two labels in each cell
        if(self.stockSymbolsArray.count > 0){
            cell.symbolLabel.text = self.stockSymbolsArray[indexPath.row].symbol
            cell.lastTradePriceOnlyLabel.text = self.stockSymbolsArray[indexPath.row].lastTradePriceOnly
            
            //Run the test inside of the cell's class implementation to see whether it has the information it needs
            if(cell.doLabelsHaveText()){
                return cell
            }
            
            else{
                cell.symbolLabel.text = "N/A"
                cell.lastTradePriceOnlyLabel.text = "N/A"
                return cell
            }
        }
        
        return cell
    }
    
    //Tapping on any cell should send the user to the DetailsViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPathToPassForSegue = indexPath.row
        self.performSegue(withIdentifier: "SHOWDETAILSVIEWCONTROLLER", sender: self)
    }
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SHOWDETAILSVIEWCONTROLLER"){
            if let viewController = segue.destination as? DetailsViewController {
                //Create strings in the format we'd like for the DetailsViewController
                let stringForSymbol = "Symbol: " + stockSymbolsArray[indexPathToPassForSegue].symbol
                let lastTradePrice  = "Price: " + stockSymbolsArray[indexPathToPassForSegue].lastTradePriceOnly
                let change = "Change: " + stockSymbolsArray[indexPathToPassForSegue].change
                let yearLow = "Year Low: " + stockSymbolsArray[indexPathToPassForSegue].yearLow
                let yearHigh = "Year High: " + stockSymbolsArray[indexPathToPassForSegue].yearHigh
                
                //Append strings into an array that the DetailsViewController has so that it knows what it needs to display in its table view
                viewController.arrayOfStringDataToShow.append(stringForSymbol)
                viewController.arrayOfStringDataToShow.append(lastTradePrice)
                viewController.arrayOfStringDataToShow.append(change)
                viewController.arrayOfStringDataToShow.append(yearLow)
                viewController.arrayOfStringDataToShow.append(yearHigh)
            }
        }
    }
}
