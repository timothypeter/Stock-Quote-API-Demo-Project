//
//  StockTableViewCellTest.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/22/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Stock_Quote_API_Demo_Project

class StockTableViewCellTest: XCTestCase {
    
    var cell: StockTableViewCell!
    let stringForSymbol = "YHOO"
    let stringForPrice = "323.23"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        cell = StockTableViewCell()
        cell.symbolLabel = UILabel()
        cell.lastTradePriceOnlyLabel = UILabel()
        cell.symbolLabel.text = stringForSymbol
        cell.lastTradePriceOnlyLabel.text = stringForPrice
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        cell = nil
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
