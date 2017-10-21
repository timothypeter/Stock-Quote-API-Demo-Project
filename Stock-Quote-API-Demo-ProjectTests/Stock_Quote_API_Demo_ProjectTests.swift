//
//  Stock_Quote_API_Demo_ProjectTests.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/19/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Stock_Quote_API_Demo_Project
@testable import SwiftyJSON
@testable import Alamofire

class Stock_Quote_API_Demo_ProjectTests: XCTestCase {
    
    var viewController: StockSymbolsViewController!
    var tableView: UITableView!
    
    //MARK: setUp and tearDown
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StockSymbolsViewController") as! StockSymbolsViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: - UITableViewTests
    
    func testTableViewIsConnectedToDelegate()
    {
        XCTAssertNotNil(viewController.tableView.delegate, "Table delegate cannot be nil");
    }
    
    func testThatViewConformsToUITableViewDataSource()
    {
        XCTAssertTrue(viewController.conforms(to: UITableViewDataSource.self), "View does not conform to UITableView datasource protocol")
    }
    
    func testStockSymbolsViewControllerTableView() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
            viewController = StockSymbolsViewController()
    
            let stockObject = StockObject()
            stockObject.symbol = "YHOO"
            stockObject.lastTradePriceOnly = "123.43"
    
            viewController.stockSymbolsArray.append(stockObject)
        
            tableView = UITableView()
            tableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "StockTableViewCell")
            tableView.dataSource = viewController
    }
    
    //MARK: Performance
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
