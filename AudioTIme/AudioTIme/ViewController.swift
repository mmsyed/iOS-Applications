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
    
    @IBOutlet var times_disc_label: UILabel!
    var device_name = String()
    
    var time_sts = String()
    var time_disc = String()
    var connected_or_dis = Bool()
    
    
    
    //let realm = try! Realm()

  
    @IBAction func reset_button(_ sender: Any) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    @IBAction func get_time(_ sender: Any) {
        
        time_stamp()
        get_and_update()

    }
    
    func time_stamp() {
        
        updatelabel()
        centralManager = CBCentralManager(delegate: self, queue: nil)
       // time_label()
        
    }
    
    func time_label() {
        
        
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        
        // get the date time String from the date object
  
        let formatted_date = formatter.string(from: currentDateTime)
        let index = formatted_date.index(of: " ") ?? formatted_date.endIndex
        let begin = formatted_date[index...]
        let res = String(begin)
        //print(res)
        
        let index2 = res.index(of: "P") ?? res.endIndex
        let begin2 = res[..<index2]
        let res2 = String(begin2)
        let test = String(res2.filter { !" \n\t\r".contains($0) })
        let realm = try! Realm()

        if (connected_or_dis) {
        time_sts = ""
        time_sts += " " + test + " / "

        
        let time = times()
        time.times_connceted = time_sts
        //save
        try! realm.write {
            realm.add(time)
            } }
        
        else {
            
            time_disc = ""
            time_disc += " " + test + " / "
            let time = times()
            time.times_discon = time_disc
            //save
            try! realm.write {
                realm.add(time)
            }

            
        }
        
     }
    
//    func time_label_discon() {
//
//        let realm = try! Realm()
//        let currentDateTime = Date()
//
//        // initialize the date formatter and set the style
//        let formatter = DateFormatter()
//
//        formatter.timeStyle = .short
//        formatter.dateStyle = .short
//
//        // get the date time String from the date object
//        print(formatter.string(from: currentDateTime))
//
//        let formatted_date = formatter.string(from: currentDateTime)
//        let index = formatted_date.index(of: " ") ?? formatted_date.endIndex
//        let begin = formatted_date[index...]
//        let res = String(begin)
//      //  print(res)
//
//        let index2 = res.index(of: "P") ?? res.endIndex
//        let begin2 = res[..<index2]
//        let res2 = String(begin2)
//        let test = String(res2.filter { !" \n\t\r".contains($0) })
//
//
//        time_disc = ""
//        time_disc += " " + test + " / "
//        let time = times()
//        time.times_discon = time_disc
//        //save
//        try! realm.write {
//            realm.add(time)
//        }
//
//       // times_disc_label.text = time_disc
//    }
//
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
        else {
            clear_all()
            create_alert(title: "Invalid name", message: "enter correct name")
        }
    }
    
    func updatelabel() {
//        device_name = str_name
//        let arrayOfServices: [name] = [name(string: device_name)]
//        self.centralManager?.scanForPeripheralsWithServices(arrayOfServices, options: nil)
//
//        let serviceUUIDs:[AnyObject] = [CBUUID(string: "180D")]
//        self.centralManager?.scanForPeripherals(withServices: serviceUUIDs as? [CBUUID], options: nil)
    
    }

    func get_and_update() {
        label.text = ""
        times_disc_label.text = ""
        times_label.text = ""
        time_sts = ""
        time_disc = ""
        let realm = try! Realm()
        let name = realm.objects(times.self)
        
        //using realm to populate local arrays and count to be used in the tableview
        var dev_name = String()
      //  print(name)
        for n in name {
           // print(n)
            if (n.device_name != nil) {
                dev_name = n.device_name!
            }
            
            if (n.times_connceted != nil) {
               // print(n.times_connceted)
                time_sts += n.times_connceted!
                //print(time_sts)
            
            }
            if (n.times_discon != nil) {
                time_disc += n.times_discon!
        }
        }
       // print(dev_name)
        device_name = dev_name
        if (connected_or_dis){
            label.text = "Connected device: \(device_name)"
        }
        else {
            label.text = "Device not connected"
        }
        
        times_disc_label.text = time_disc
        times_label.text = time_sts
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
        get_and_update()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //get_and_update()
//        time_stamp()
//        get_and_update()
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
                print(peripheral)
                print("Name: \(peripheral.name!)")
               //label.text = "Airpods connected: \(peripheral.name!)"
                connected_or_dis = true
                time_label()
                centralManager?.stopScan()
        }

        
        else{
            print("device not found")
            print("*************************************")
            connected_or_dis = false
            time_label()
            centralManager?.stopScan()
        }
        }
    }
    
    func clear_all() {
        device_name = "Device not found"
        label.text = ""
        times_label.text = ""
        times_disc_label.text = ""
    }
    func create_alert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

