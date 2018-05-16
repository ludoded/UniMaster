//
//  Listing.swift
//  master
//
//  Created by Haik Ampardjian on 16.05.2018.
//  Copyright © 2018 Haik Ampardjian. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Listing {
    let data: [ListingItem]
    let metadata: ListingMetadata
    
    init(with json: JSON) {
        self.data = json["data"].arrayValue.map({ ListingItem.init(with: $0) })
        self.metadata = ListingMetadata(with: json["metadata"])
    }
}

struct ListingItem {
    let id: Int
    let name: String
    let symbol: String
    let websiteSlug: String
    
    init(with json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.symbol = json["symbol"].stringValue
        self.websiteSlug = json["website_slug"].stringValue
    }
}

struct ListingMetadata {
    let timestamp: Double
    let numCryptocurrencies: Int
    let error: String?
    
    init(with json: JSON) {
        self.timestamp = json["timestamp"].doubleValue
        self.numCryptocurrencies = json["num_cryptocurrencies"].intValue
        self.error = json["error"].string
    }
}
