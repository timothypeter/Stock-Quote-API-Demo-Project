//
//  DetailsViewControllerTest.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/26/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Stock_Quote_API_Demo_Project

class DetailsViewControllerTest: XCTestCase {
    
    var viewController: DetailsViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        //This is the recommended/popular way to make sure the view gets initialized without creating overhead
        _ = viewController.view
    }
    
    //Make sure the view controller isn't nil
    func testIsViewControllerNotNil() {
        XCTAssertNotNil(viewController)
    }
    
    //Make sure the view controller's view isn't nil
    func testIsViewInVCNotNil(){
        XCTAssertNotNil(viewController.view)
    }
    
    //MARK: tableView tests
    //Make sure the tableView of the view controller isn't nil
    func testIsTableViewNotNil(){
        XCTAssertNotNil(viewController.tableView)
    }
    
    func testTableViewNumberOfSections() {
        let expectedNumOfSections: Int = 1
        XCTAssertTrue(viewController.tableView.numberOfSections == expectedNumOfSections, "Incorrect number of sections in tableView!")
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
