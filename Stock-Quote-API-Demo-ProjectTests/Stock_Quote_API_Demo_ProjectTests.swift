//
//  Stock_Quote_API_Demo_ProjectTests.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/19/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Stock_Quote_API_Demo_Project

class Stock_Quote_API_Demo_ProjectTests: XCTestCase {
    
    //MARK: setUp and tearDown
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "StockSymbolsViewController") as! StockSymbolsViewController
        //UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StockSymbolsViewController") as! StockSymbolsViewController
        
        let stockObject = StockObject(symbol: "YHOO", lastTradePriceOnly: "123.43")
        stockObject.symbol = "YHOO"
        stockObject.lastTradePriceOnly = "123.43"
        
        tableView = UITableView()
        
        viewController.stockSymbolsArray.append(stockObject)
        viewController.tableView = tableView
        viewController.tableView.delegate = viewController
        viewController.tableView.dataSource = viewController
        
        _ = viewController.view
        
        //viewController.performSelector(onMainThread: #selector(viewController.loadView), with: nil, waitUntilDone: true)
 */
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: Performance
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
