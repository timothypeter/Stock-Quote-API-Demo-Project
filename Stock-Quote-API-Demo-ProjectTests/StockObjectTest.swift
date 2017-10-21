//
//  StockObjectTest.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/21/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Pods_Stock_Quote_API_Demo_Project

class StockObjectTest: XCTestCase {
    
    let testSymbol = "YHOO"
    let tradePrice = "300.00"
    var stockObject:StockObject!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        stockObject = StockObject(symbol: testSymbol, lastTradePriceOnly: tradePrice)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        stockObject = nil
    }
    
    func testForSymbolAndTradePrice() {
        //Make sure that a stock object can't initialize properly without having
        //Generates a failure when expression == true. Equivalent to XCTAssert. - Apple documentation
        XCTAssertFalse((stockObject.symbol.isEmpty) && (stockObject.lastTradePriceOnly.isEmpty), "Stock object has an empty symbol or price!")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
