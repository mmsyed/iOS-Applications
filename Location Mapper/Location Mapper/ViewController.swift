//
//  ViewController.swift
//  Location Mapper
//
//  Created by Mo Syed on 6/13/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    @IBOutlet var map: MKMapView!
    var loc_manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loc_manager.delegate = self
        loc_manager.desiredAccuracy = kCLLocationAccuracyBest
        loc_manager.requestWhenInUseAuthorization()
        loc_manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        let user_loc: CLLocation = locations[0]
        let lat = user_loc.coordinate.latitude
        let lon = user_loc.coordinate.latitude
        let alt = user_loc.altitude
//        print("altitude: \(alt)")
        let speed = user_loc.speed
//        print("\(lat) , \(lon)")
//        print("speed: \(speed)")
//
        let lat_delta: CLLocationDegrees = 0.05
        let lon_delta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: lat_delta, longitudeDelta: lon_delta)
        
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        
        self.map.setRegion(region, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(user_loc) { (placemarks, error) in
            if (error == nil) {
                if let placemark = placemarks?[0] {
                    let alt  = ""
                    if placemark. 
                }
            }
        }
        
    }
    }

