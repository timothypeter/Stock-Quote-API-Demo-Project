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
    
    func testStockObjectInitialization() {
        let newStockObj = StockObject.init(symbol: "YHOO", lastTradePriceOnly: "320.00", change: "+53.2", yearLow: "32.0", yearHigh: "500.00")
        XCTAssertNotNil(newStockObj)
    }
    
    func testStockObjectInitializationFails(){
        let newStockObj = StockObject.init(symbol: "", lastTradePriceOnly: "", change: "", yearLow: "", yearHigh: "")
        XCTAssertNil(newStockObj)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //stockObject = StockObject(symbol: testSymbol, lastTradePriceOnly: tradePrice)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        //Best practice to set to nil in teardown when done. This obviously can't be done on strings because in Swift you can't set a string to nil.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
