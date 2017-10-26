//
//  StockSymbolsViewController.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/19/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit

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
