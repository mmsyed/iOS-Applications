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
    
    @IBOutlet var lon_label: UILabel!
    @IBOutlet var lat_label: UILabel!
    @IBOutlet var speed_label: UILabel!
    @IBOutlet var course_label: UILabel!
    @IBOutlet var alt_label: UILabel!
    @IBOutlet var ad1: UILabel!
    @IBOutlet var ad2: UILabel!
    @IBOutlet var ad3: UILabel!
    @IBOutlet var ad4: UILabel!
    @IBOutlet var adlabel: UILabel!
    
    
    
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
        self.lat_label.text = String(lat)
        self.lon_label.text = String(lon)
        self.speed_label.text = String(user_loc.speed)
        self.course_label.text = String(user_loc.course)
        self.alt_label.text = String(user_loc.altitude)
        
//        let lat_delta: CLLocationDegrees = 0.05
//        let lon_delta: CLLocationDegrees = 0.05
//
//        let span = MKCoordinateSpan(latitudeDelta: lat_delta, longitudeDelta: lon_delta)
//
//
//        let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
//
//        let region = MKCoordinateRegion(center: location, span: span)
//
//        self.map.setRegion(region, animated: true)
        var address = ""
        CLGeocoder().reverseGeocodeLocation(user_loc) { (placemarks, error) in
            if (error == nil) {
                if let placemark = placemarks?[0] {
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                        
                    }
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"
                      //  self.ad1.text = address

                    }
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + " \n"
                     //   self.ad2.text = placemark.subLocality!

                    }
                    if placemark.subAdministrativeArea != nil {
                      //  self.ad3.text = placemark.subAdministrativeArea!

                        address += placemark.subAdministrativeArea! + " \n"
                    }
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + "\n"
//                        self.ad4.text = placemark.postalCode!

                    }
                    if placemark.country != nil {
                        address += placemark.country! + "\n"
                    }
                    print(address)
                    self.ad1.text = address
                }
            }
            }
        }
        
    }

