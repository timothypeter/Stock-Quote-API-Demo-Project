//
//  Globals.swift
//  Stock-Quote-API-Demo-Project
//
//  Created by Tim on 10/22/17.
//  Copyright © 2017 Timothy Peter. All rights reserved.
//

import Foundation

//Put some helpful strings here for reuse
struct Globals {
    static let kStockInfoURL = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22YHOO%22%2C%22AAPL%22%2C%22GOOG%22%2C%22MSFT%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="
}
