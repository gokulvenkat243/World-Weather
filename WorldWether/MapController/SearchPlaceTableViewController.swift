//
//  SearchResultTableViewController.swift
//  WorldWether
//
//  Created by gokul v on 24/07/24.
//

import UIKit
import MapKit

protocol SearchPlaceTableVc: AnyObject {
    func selectLocation(_ map: MKMapItem)
}

class SearchPlaceTableViewController: UITableViewController {
    
    var delegate: SearchPlaceTableVc?
    
    var mapResult: [MKMapItem] = []
    var mapView: MKMapView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mapResult.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let a = mapResult[indexPath.row]
        cell.textLabel?.text = a.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mapResult[indexPath.row]
        delegate?.selectLocation(item)
    }
}
