//
//  StockObjectViewModelTest.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/26/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Stock_Quote_API_Demo_Project

class StockObjectViewModelTest: XCTestCase {
    
    var stockObjViewModel: StockObjectViewModel!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //Begin retrieving data
        DataManager.sharedInstance.getStockQuotes()
        stockObjViewModel = StockObjectViewModel(reloadTableViewCallback: fakeCallBackToInitialize)
    }
    
    func fakeCallBackToInitialize() {
        print("Callback")
    }
    
    func testStockObjectInitialization() {
        XCTAssertNotNil(stockObjViewModel)
    }
    
    //I wanted to test this, but the asynchronous nature of DataManager will make this difficult, and I'm running out of time.
    func testRetrieveData() {
        //stockObjViewModel.retrieveData()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
