//
//  Globals.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/22/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation
import UIKit

//Put some helpful strings here for reuse
struct Globals {
    //The url for the only call this app makes. It's still good practice to keep it as a reusable string to keep with best practices, and for easy readability later.
    static let kStockInfoURL = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22YHOO%22%2C%22AAPL%22%2C%22GOOG%22%2C%22MSFT%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
    static let kQuotesObtainedNotification = "kQuotesObtainedNotification"
}

//A utility function I wrote to change the second half of a string to be green. This is to show a positive change in "change" that comes back when looking up a stock
public func changeSecondHalfToGreen(stringToSplitAndColor: String) -> NSMutableAttributedString {
    //Need to make an array of strings that I can split into two, separated by :
    let newArrayOfStrings = stringToSplitAndColor.components(separatedBy: ":")
    
    //Grab everything to the right of the :
    let attributedString2 = newArrayOfStrings[1]
    
    //Get the range of everything to the right of the colon
    let range = (stringToSplitAndColor as NSString).range(of: attributedString2)
    
    //Create an attributed string so that we can change the color to green
    let attribute = NSMutableAttributedString.init(string: stringToSplitAndColor)
    attribute.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.green], range: range)
    
    return attribute
}
