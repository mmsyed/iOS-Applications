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

    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
        let user_loc: CLLocation = locations[0]
        let lat = user_loc.coordinate.latitude
        let lon = user_loc.coordinate.latitude
        self.lat_label.text = String(lat)
        self.lon_label.text = String(lon)
        self.speed_label.text = String(user_loc.speed)
        self.course_label.text = String(user_loc.course)
        self.alt_label.text = String(user_loc.altitude)

        var address = ""
        CLGeocoder().reverseGeocodeLocation(user_loc) { (placemarks, error) in
            if (error == nil) {
                if let placemark = placemarks?[0] {
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare! + " "
                        
                    }
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"   }
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + " \n"
                    }
                    if placemark.subAdministrativeArea != nil {

                        address += placemark.subAdministrativeArea! + " \n"
                    }
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + "\n"
                    }
                    if placemark.country != nil {
                        address += placemark.country! + "\n"
                    }
                    print(address)
                    self.ad1.text = address
                }
            }
            else {
                print("error")
            }
            }
        }
        
    }

