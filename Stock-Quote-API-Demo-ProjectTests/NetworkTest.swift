//
//  NetworkTest.swift
//  Stock-Quote-API-Demo-ProjectTests
//
//  Created by Tim on 10/21/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import XCTest

@testable import Stock_Quote_API_Demo_Project

class NetworkTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //This tests the main server call I use in the app. However, this has to be written differently due to the fact that if I use my "router" file that I have from Alamofire, the test will succeed without waiting for the async call to finish. This approach is directly from Apple's documentation. https://developer.apple.com/documentation/xctest/asynchronous_tests_and_expectations/testing_asynchronous_operations_with_expectations
    
    func testStockInfoCall() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectation = XCTestExpectation(description: "Download stock info")
        
        // Create a URL for a web page to be downloaded.
        let url = URL(string: Globals.kStockInfoURL)!
        
        // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                if let query = json["query"] as? [String: Any]{
                    if let results = query["results"] as? [String: Any]{
                        if let quotes = results["quote"] as? [[String: Any]]{
                            for quote in quotes{
                                
                            }
                        }
                        
                    }
                }
                
            } catch let error as NSError {
                print(error)
            }
            
            // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
