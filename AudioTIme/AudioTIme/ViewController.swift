//
//  ViewController.swift
//  AudioTime
//
//  Created by Mo Syed on 6/29/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import CoreBluetooth
import RealmSwift


class ViewController: UIViewController, CBCentralManagerDelegate {

    @IBOutlet var name_field: UITextField!
    @IBOutlet var label: UILabel!
    var centralManager : CBCentralManager?
    @IBOutlet var times_label: UILabel!
    
    var device_name = String()
    
    var time_sts = String()
    
    //let realm = try! Realm()

    
    
    @IBAction func get_time(_ sender: Any) {
        
        time_stamp()
//        // get the current date and time
//        let currentDateTime = Date()
//
//        // initialize the date formatter and set the style
//        let formatter = DateFormatter()
////        formatter.timeStyle = .medium
////        formatter.dateStyle = .long
//        formatter.timeStyle = .short
//        formatter.dateStyle = .short
//
//        // get the date time String from the date object
//        print(formatter.string(from: currentDateTime)) // October 8, 2016 at 10:48:53 PM
//
//        let formatted_date = formatter.string(from: currentDateTime)
//        let index = formatted_date.index(of: " ") ?? formatted_date.endIndex
//        let begin = formatted_date[index...]
//        let res = String(begin)
//        print(res)
//
//        let index2 = res.index(of: "P") ?? res.endIndex
//        let begin2 = res[..<index2]
//        let res2 = String(begin2)
//        let test = String(res2.filter { !" \n\t\r".contains($0) })
//
    }
    
    func time_stamp() {
        
        updatelabel()

        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        //        formatter.timeStyle = .medium
        //        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        // get the date time String from the date object
        print(formatter.string(from: currentDateTime)) // October 8, 2016 at 10:48:53 PM
        
        let formatted_date = formatter.string(from: currentDateTime)
        let index = formatted_date.index(of: " ") ?? formatted_date.endIndex
        let begin = formatted_date[index...]
        let res = String(begin)
        print(res)
        
        let index2 = res.index(of: "P") ?? res.endIndex
        let begin2 = res[..<index2]
        let res2 = String(begin2)
        let test = String(res2.filter { !" \n\t\r".contains($0) })
        
        
        time_sts += test
        times_label.text = time_sts
        
        
        
    }
    
    @IBAction func enter(_ sender: Any) {
        let realm = try! Realm()
        
        if name_field.text != "" {
            let store_name = name_field.text!
            //let realm = try! Realm()
            
            let name = times()
            //time.time_check = "11:00"
            name.device_name = store_name
            //save
            try! realm.write {
                realm.add(name)
            }
        }
     //  updatelabel()
        
    }
    
    func updatelabel() {
        let realm = try! Realm()
        
        let name = realm.objects(times.self)
        
        //using realm to populate local arrays and count to be used in the tableview
        var str_name = String()
        for n in name {
            if (n.device_name != nil) {
            str_name = n.device_name!
        }
        }
        print(str_name)
        device_name = str_name
        
      //  label.text = ""
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
//        if name_field.text != "" {
//            device_name = name_field.text!
//        }
       // device_name = "Mo's AirPods"
    }
    
    func fetch() {
        label.text = "bg fetch"
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let realm = try! Realm()
        print("url")

        print(Realm.Configuration.defaultConfiguration.fileURL!)
//        var time = times()
//        time.time_check = "11:00"
//        //save
//       try! realm.write {
//            realm.add(time)
//        }
    }

    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: nil, options: nil)
        }
        
        else {
            create_alert(title: "Connection Failed", message: "Try Again")
            
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if (peripheral.name != nil && device_name != ""){
            if (peripheral.name! == device_name) {
                print("Name: \(peripheral.name!)")
              label.text = "Airpods found: \(peripheral.name!)"
               // centralManager?.stopScan()
        }

        
       // else{
//            print("device not found")
//            print("*************************************")
           // centralManager?.stopScan()

       // }
        }
    }
    
    func create_alert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}

