//
//  Stock_Quote_API_Demo_ProjectUITests.swift
//  Stock-Quote-API-Demo-ProjectUITests
//
//  Created by Tim on 10/19/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

class Stock_Quote_API_Demo_ProjectUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //My first functional UI test, even if basic.
    func testExample() {
        // Use recording to get started writing UI tests.
        
        let tablesQuery = XCUIApplication().tables
        let msft7881Cell = tablesQuery.cells["MSFT, 78.81"]
        msft7881Cell.swipeUp()
        tablesQuery.cells["AAPL, 156.25"].swipeDown()
        tablesQuery.cells["GOOG, 988.20"].tap()
        msft7881Cell.tap()
                                                // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
