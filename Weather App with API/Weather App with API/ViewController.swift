//
//  ViewController.swift
//  Weather App with API
//
//  Created by Mo Syed on 6/10/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    //@IBOutlet var web_view: WKWebView!
    @IBOutlet var user_city: UITextField!
    @IBOutlet var location_label: UILabel!
    @IBOutlet var condition_label: UILabel!
    @IBOutlet var temp_label: UILabel!
    @IBOutlet var temp_disc: UILabel!
    @IBOutlet var temp_img: UIImageView!
    
    var lat: Double = 0.0 {
        didSet{
        }
    }
    
    var lon: Double = 0.0 {
        didSet{
        }
    }
    

    @IBAction func get_weather(_ sender: Any) {
        get_update_weather()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.user_city.delegate = self
        temp_img.image = UIImage(named: "01d")
        
        
    }
    
    func get_cordinates(address: String) {
        
        print(address)
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard
                let placemark = placemarks?.first
            else {
                self.location_label.text = "Please input correct address"
                return
            }
            
            self.lat = (placemark.location?.coordinate.latitude ?? 0)
            self.lon = (placemark.location?.coordinate.longitude ?? 0)

        }
    }
    
    func get_update_weather() {

        get_cordinates(address: user_city.text ?? "")
        if ((lon != 0 ) && (lat != 0)) {
            let url = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=ab75df50e0d0c475e5dc2af605e293f2&units=imperial"
        
        Alamofire.request(url).responseJSON{
            response in
            if let result_json = response.result.value {
                let json_response = JSON(result_json)
                let weather = json_response["weather"].array![0]
            
                let json_temp = json_response["main"]
             
                self.location_label.text = "Location: " + json_response["name"].stringValue
                self.condition_label.text = "Condition: " +  weather["description"].stringValue
                self.temp_label.text = "Temperature: \(Int(json_temp["temp"].double!)) F"
                self.temp_disc.text =  "Humidity: \(Int(json_temp["humidity"].double!))"
                self.temp_img.image = UIImage(named: weather["icon"].stringValue)
            }
            
        }}
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        user_city.resignFirstResponder()

        get_update_weather()
        return true
    }

}

