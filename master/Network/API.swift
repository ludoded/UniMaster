//
//  API.swift
//  master
//
//  Created by Haik Ampardjian on 16.05.2018.
//  Copyright © 2018 Haik Ampardjian. All rights reserved.
//

import Foundation
import Alamofire

struct API {
    static func listings() -> DataRequest {
        return Alamofire.request(Router.listings)
    }
}
