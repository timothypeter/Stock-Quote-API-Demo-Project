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
    
    func testTappingInDetailController() {
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.cells["AAPL, 156.25"].tap()
        
        let price15625StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Price: 156.25"]/*[[".cells.staticTexts[\"Price: 156.25\"]",".staticTexts[\"Price: 156.25\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        price15625StaticText.tap()
        
        let change027StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Change: +0.27"]/*[[".cells.staticTexts[\"Change: +0.27\"]",".staticTexts[\"Change: +0.27\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        change027StaticText.tap()
        
        let yearLow10408StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Year Low: 104.08"]/*[[".cells.staticTexts[\"Year Low: 104.08\"]",".staticTexts[\"Year Low: 104.08\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yearLow10408StaticText.tap()
        
        let yearHigh16494StaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Year High: 164.94"]/*[[".cells.staticTexts[\"Year High: 164.94\"]",".staticTexts[\"Year High: 164.94\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        yearHigh16494StaticText.tap()
        change027StaticText.tap()
        price15625StaticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Symbol: AAPL"]/*[[".cells.staticTexts[\"Symbol: AAPL\"]",".staticTexts[\"Symbol: AAPL\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        change027StaticText.tap()
        yearLow10408StaticText.tap()
        yearHigh16494StaticText.tap()
        change027StaticText.tap()
    }
    
    func testSwipingOnStockSymbolsViewController(){
        let aapl15625Table = XCUIApplication()/*@START_MENU_TOKEN@*/.tables.containing(.cell, identifier:"AAPL, 156.25").element/*[[".tables.containing(.cell, identifier:\"MSFT, 78.81\").element",".tables.containing(.cell, identifier:\"GOOG, 988.20\").element",".tables.containing(.cell, identifier:\"AAPL, 156.25\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aapl15625Table.swipeUp()
        aapl15625Table.swipeUp()
        aapl15625Table/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aapl15625Table.swipeUp()
        aapl15625Table.swipeUp()
        aapl15625Table.swipeUp()
        aapl15625Table.swipeLeft()
        aapl15625Table.swipeRight()
        aapl15625Table.swipeDown()
        aapl15625Table.swipeUp()
    }
    
    func testReachingDetailControllerAndBackingOut() {
        let app = XCUIApplication()
        app.tables.cells["AAPL, 156.25"].tap()
        app.navigationBars["Details"].buttons["Stock Symbols"].tap()
    }
}
