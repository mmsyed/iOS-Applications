//
//  ViewController.swift
//  News Reader
//
//  Created by Mo Syed on 6/19/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    static var selected_cntry: String = "" {
        didSet{
        }
    }

    static var selected_ctgry: String = "" {
        didSet{
        }
    }

    
    @IBAction func read(_ sender: Any) {
       // let con = SecondViewController()
    }
    
    @IBOutlet var country_sel: UIPickerView!
    @IBOutlet var cat_picker: UIPickerView!
    
    let countries = ["", "us", "ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp", "kr", "lt", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro", "rs", "ru", "sa", "se", "sg", "si",
        "sk", "th", "tr", "tw", "ua", "ve", "za"]
    
    let category = ["", "business", "general", "health", "science", "sports", "technology"]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return countries[row] }
        else {
            return category[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return countries.count }
        else {
            return category.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Meatlabel.text = activityoptions[row]
        if pickerView.tag == 1 {
            ViewController.selected_cntry = countries[row]
        }
        else {
            ViewController.selected_ctgry = category[row] }
        print(ViewController.selected_cntry)
        print(ViewController.selected_ctgry)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

