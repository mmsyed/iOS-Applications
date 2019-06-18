//
//  SecondViewController.swift
//  Location Mapper
//
//  Created by Mo Syed on 6/18/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    var loc_manager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loc_manager.delegate = self
        loc_manager.desiredAccuracy = kCLLocationAccuracyBest
        loc_manager.requestWhenInUseAuthorization()
        loc_manager.startUpdatingLocation()

    }
    
//    func show_map(reg: MKCoordinateRegion) {
//        self.map.setRegion(reg, animated: true)
//    }
//
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let user_loc: CLLocation = locations[0]
        let lat = user_loc.coordinate.latitude
        let lon = user_loc.coordinate.latitude
        let lat_delta: CLLocationDegrees = 0.05
        let lon_delta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: lat_delta, longitudeDelta: lon_delta)
        
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
        
    }
    
}
