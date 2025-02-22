//
//  HomePageViewController.swift
//  WorldWether
//
//  Created by gokul v on 24/07/24.
//

import UIKit
import MapKit

class HomePageViewController: UIViewController, SearchPlaceTableVc {
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var searchController: UISearchController?
    let locationManager = CLLocationManager()
    let searchPlaceTableVC = SearchPlaceTableViewController()
    
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempretureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    var name: String
//    var age: Int = Int()
//    var <variableName>: <DataType> = <DataType>()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpSearchController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.setHidesBackButton(true, animated: true)
        
        addChild(searchPlaceTableVC)
        view.addSubview(searchPlaceTableVC.tableView)
        searchPlaceTableVC.tableView.translatesAutoresizingMaskIntoConstraints = false
        searchPlaceTableVC.mapView = mapView
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        setUpMapView()
        setupLabels()
        searchPlaceTableVC.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(tapToLogout))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.2.fill"), style: .done, target: self, action: #selector(tapUserList))
        
        viewModel.getUserName {
            self.welcomeLabel.text = "Name: \(self.viewModel.userName.first?.firstName ?? "Error")"
        }
    }
    
    private func setUpMapView() {
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpSearchController() {
        searchController?.searchBar.placeholder = "search Place"
        searchController = UISearchController(searchResultsController: searchPlaceTableVC)
        searchController?.searchResultsUpdater = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    func setupLabels() {
        mapView.addSubview(welcomeLabel)
        mapView.addSubview(cityNameLabel)
        mapView.addSubview(tempretureLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.bottomAnchor.constraint(equalTo: cityNameLabel.topAnchor, constant: -10),
            welcomeLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            tempretureLabel.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -80),
            tempretureLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            tempretureLabel.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            cityNameLabel.bottomAnchor.constraint(equalTo: tempretureLabel.topAnchor, constant: -10),
            cityNameLabel.leadingAnchor.constraint(equalTo: mapView.leadingAnchor, constant: 20),
            cityNameLabel.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
        ])
    }
    
    func showMap(_ mapItem: MKMapItem) {
        let region = MKCoordinateRegion(center: mapItem.placemark.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        mapView.addAnnotation(annotation)
        searchPlaceTableVC.tableView.isHidden = true
    }
    
    @objc func tapUserList() {
        viewModel.tapToUserListView()
    }
    
    @objc func tapToLogout() {
        viewModel.autoLogged()
        viewModel.tapToLogout()
    }
}

extension HomePageViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            searchPlaceTableVC.mapResult.removeAll()
            searchPlaceTableVC.tableView.reloadData()
            searchPlaceTableVC.tableView.isHidden = false
            return
        }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { [self] response, error in
            guard let response = response else {
                if error != nil {
                    print("error")
                }
                return
            }
            
            let result = viewModel.extractGps(input: response.mapItems[0].placemark.region?.identifier ?? "error")
            let lattitude = result[0]
            let longitude = result[1]
            
            let networkAPI = APIManager()
            let viewModel = WhetherDetailsViewModel(lattitude: lattitude, longitude: longitude, networkManager: networkAPI)
            viewModel.getWhetherDetails {
                DispatchQueue.main.async { [self] in
                    cityNameLabel.text = "City Name: \(viewModel.models?.first?.city_name ?? "Error")"
                    tempretureLabel.text = "Tempreture: \(viewModel.models?.first?.app_temp ?? 0.0)"
                }
            }
            
            self.searchPlaceTableVC.mapResult = response.mapItems
            DispatchQueue.main.async {
                self.searchPlaceTableVC.tableView.reloadData()
                self.searchPlaceTableVC.tableView.isHidden = false
            }
        }
    }
    
    func selectLocation(_ map: MKMapItem) {
        showMap(map)
    }
}

