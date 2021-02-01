//
//  SearchViewController.swift
//  WorkHoursTracker
//
//  Created by Tommy Smale on 1/15/21.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func annotateSelectedResult(mapItem: MKMapItem)
}

class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate, CLLocationManagerDelegate, HandleMapSearch, MKMapViewDelegate {

    //MARK: Properties
    var searchController: UISearchController!
    weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    weak var annotationView: MKAnnotationView!
    
    //MARK: Life cycle
    override func loadView() {
        super.loadView()
        
        let margins = view.safeAreaLayoutGuide
        
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: margins.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
        self.mapView = mapView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let resultsTableViewController = ResultsTableViewController()
        resultsTableViewController.handleMapSearchDelegate = self
        
        searchController = UISearchController(searchResultsController: resultsTableViewController)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "Search for a place or address" 
        
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchController.searchBar)
        navigationItem.title = "Select a location"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.setRightBarButton(UIBarButtonItem(systemItem: UIBarButtonItem.SystemItem.done), animated: false)
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.backBarButtonItem?.isEnabled = false
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        /*
        if(!mapView.isUserLocationVisible) {
            print("Users location is not visible")
        }
        */
    }
    
    //UISearchResultsUpdating protocol
    func updateSearchResults(for searchController: UISearchController) {
        if let resultsTableViewController = searchController.searchResultsController as? ResultsTableViewController {
            resultsTableViewController.query = searchController.searchBar.text ?? "" //If searchBar.text is nil display ""
            resultsTableViewController.tableView.reloadData()
        }
    }
    
    //MARK: SearchBar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchController.searchBar.text ?? ""
        searchRequest.region = mapView.region //TODO: set mapView.region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { (response, error) in
            guard let response = response else {
                print("MKLocalSearch error")
                return
            }
            
            if let resultsTableViewController = self.searchController.searchResultsController as? ResultsTableViewController {
                resultsTableViewController.results = response.mapItems
                resultsTableViewController.tableView.reloadData()
            }
            
            for item in response.mapItems {
                if let name = item.name,
                   let location = item.placemark.location {
                    print("\(name): \(location.coordinate.latitude),\(location.coordinate.longitude)")
                }
            }
        }

    }
    
    //MARK: LocationManager delegate
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            //mapView.setCenter(mapView.userLocation.coordinate, animated: true)
            print("May use location while using app")
        case .denied:
            print("location permission deenied")
        default:
            assert(true, "LocationMangager permissions")
        }
    }
    
    //HandleMapSearch protocol
    func annotateSelectedResult(mapItem: MKMapItem) {
        //let annotationView = MKAnnotationView(annotation: mapItem.placemark, reuseIdentifier: mapItem.name)
        //self.annotationView = annotationView
        mapView.addAnnotation(mapItem.placemark)
        mapView.showAnnotations(mapView.annotations, animated: true)
        navigationItem.rightBarButtonItem?.isEnabled = true
        /*
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.placemark.name
        //mapView.addAnnotation(annotation)
        */
    }
    
    //MARK: MKMapViewDelegate
    //When annotation view comes into view, map view delegate asks for annotation view
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            print("Users Location no need to add anotation")
            return nil
        }
        //let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation.title)
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    //private func mapView(_ mapView: MKMapView, didUpdate userLocation: CLLocation?) {
        //Called when prop .showsUserLocation is true and location update is received by the map
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        let coordinateRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: span)
        mapView.setRegion(coordinateRegion, animated: false)
    }
    
    @objc func doneButtonPressed() {
        
    }
    
}

class Annotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(mapItem: MKMapItem) {
        self.coordinate = mapItem.placemark.coordinate
        self.title = mapItem.name
    }
}
