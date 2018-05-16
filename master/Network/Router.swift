//
//  Router.swift
//  master
//
//  Created by Haik Ampardjian on 16.05.2018.
//  Copyright © 2018 Haik Ampardjian. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static var baseURL: String = "https://api.coinmarketcap.com/v2/"
    
    case listings
    case ticker
    case specificTicker(tickerId: String)
    case globalData
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .listings:
            return "listings/"
        case .ticker:
            return "ticker/"
        case .specificTicker(let tickerId):
            return "ticker/\(tickerId)/"
        case .globalData:
            return "global/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = Foundation.URL(string: Router.baseURL)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        

        let urlEncoder = URLEncoding.default
        
        switch self {
        case .listings,
            .ticker,
            .specificTicker,
            .globalData:
            return try urlEncoder.encode(urlRequest, with: nil)
        }
    }
}
