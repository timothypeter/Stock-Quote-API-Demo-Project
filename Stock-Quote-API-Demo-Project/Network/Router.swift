//Based off of Router in official Alamofire on Github
/*https://github.com/Alamofire/Alamofire*/

import Foundation
import Alamofire

public enum Router: URLRequestConvertible {
    
    static let baseURLPath = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quote%20where%20symbol%20in%20(%22YHOO%22%2C%22AAPL%22%2C%22GOOG%22%2C%22MSFT%22)&format=json&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback="

    case getStockInfo(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getStockInfo:
            return .get
            
        }
    }
    
    var path: String {
        switch self {
        case .getStockInfo:
            return Router.baseURLPath
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try Router.baseURLPath.asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getStockInfo(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with:  parameters)
            print(urlRequest)
        default:
            break
        }
        
       // urlRequest.setValue(Router.githubAcceptStringV3, forHTTPHeaderField: "Accept")
        
        return urlRequest
    }
}

