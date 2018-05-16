//
//  ViewController.swift
//  master
//
//  Created by Haik Ampardjian on 16.05.2018.
//  Copyright © 2018 Haik Ampardjian. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listings: [ListingItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchListing()
        
        tableView.refreshControl = UIRefreshControl(frame: .zero)
    }
    
    func fetchListing() {
        API.listings().responseJSON { (response) in
            guard let JSONObject = response.value
                else { return }
            
            let json = JSON(JSONObject)
            let listing = Listing(with: json)
            self.listings = listing.data
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            dump(listing)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell.textLabel?.text = listings[indexPath.row].name
            cell.detailTextLabel?.text = listings[indexPath.row].symbol
            return cell
        } else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
            cell.textLabel?.text = listings[indexPath.row].name
            cell.detailTextLabel?.text = listings[indexPath.row].symbol
            return cell
        }
    }
}
