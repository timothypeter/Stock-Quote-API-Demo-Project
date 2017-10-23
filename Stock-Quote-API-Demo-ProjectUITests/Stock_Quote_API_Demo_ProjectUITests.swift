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
    
    //Re-wrote this the right way. Tests tapping the first cell in StockViewController, and then backing out of DetailViewController
    func testTappingFirstCellInStockViewController() {
        let app = XCUIApplication()
        let buttonQuery = app.cells.matching(identifier: "stockCell")
        let firstCell = buttonQuery.element(boundBy: 0)
        firstCell.tap()
        app.navigationBars["Details"].buttons["Stock Symbols"].tap()
    }
    
    func testSwipingOnStockSymbolsViewController(){
        //let aapl15625Table = XCUIApplication()/*@START_MENU_TOKEN@*/.tables.containing(.cell, identifier:"AAPL, 156.25").element/*[[".tables.containing(.cell, identifier:\"MSFT, 78.81\").element",".tables.containing(.cell, identifier:\"GOOG, 988.20\").element",".tables.containing(.cell, identifier:\"AAPL, 156.25\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let tables = XCUIApplication().tables.containing(.cell, identifier: "stockCell")
        let table = tables.element
        table.swipeUp()
        table.swipeDown()
    }
}
