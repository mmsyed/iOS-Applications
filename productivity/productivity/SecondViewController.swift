//
//  SecondViewController.swift
//  productivity
//
//  Created by Mo Syed on 11/7/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var s1: UISlider!
    @IBOutlet var s2: UISlider!
    @IBOutlet var s3: UISlider!
    @IBOutlet var s4: UISlider!
    @IBOutlet var s5: UISlider!
    
    @IBOutlet var goal1text: UITextField!
    @IBOutlet var goal2text: UITextField!
    @IBOutlet var goal3text: UITextField!
    @IBOutlet var goal4text: UITextField!
    @IBOutlet var goal5text: UITextField!
    
    @IBOutlet var goal1label: UILabel!
    @IBOutlet var goal2label: UILabel!
    @IBOutlet var goal3label: UILabel!
    @IBOutlet var goal4label: UILabel!
    @IBOutlet var goal5label: UILabel!
    
    @IBOutlet var prLabel: UILabel!
    
    var prHours = Double()
    var prHoursLeft = Double()
    var exHours = Int()
    var percentTotal = 100.00
    var percentLeft = 100.00
    var sleepHours = Double()
    var commuteHours = Double()
    var foodHours = Double()

    let realm = try! Realm()
    
    @IBOutlet var submit: UIButton!
    @IBAction func submit_button(_ sender: Any) {
   clean()
        let new_save = hourTracker()
        
        new_save.productiveHours = prHours
        
        new_save.goal1 = goal1text.text!
        new_save.hours1 = Double(s1.value)
        
        new_save.goal2 = goal2text.text!
        new_save.hours2 = Double(s2.value)
        
        new_save.goal3 = goal3text.text!
        new_save.hours3 = Double(s3.value)
        
        new_save.goal4 = goal4text.text!
        new_save.hours4 = Double(s4.value)
        
        new_save.goal5 = goal5text.text!
        new_save.hours5 = Double(s5.value)
        
        new_save.commuteHours = commuteHours
        new_save.sleepHours = sleepHours
        new_save.foodHours = foodHours
        
        try! realm.write {
            realm.add(new_save)
        }
}
    
    func clean(){
        let goals = realm.objects(hourTracker.self)

        
        try! realm.write {

                for g in goals {
                    self.realm.delete(g)
                        }
        }
           
    }

    @IBAction func test(_ sender: Any) {
    }
    
    func updates1(sender : UISlider){

        if(sender == s1 && prHoursLeft != 0.0){
            var hours  = Double(s1.value)
            prHoursLeft = prHoursLeft - hours
            updates1()
        }
        
        if(sender == s2 && prHoursLeft != 0.0){
            var hours  = Double(s2.value)
            prHoursLeft = prHoursLeft - hours
            updates2()
        }
        if(sender == s3 && prHoursLeft != 0.0){
            var hours  = Double(s3.value)
            prHoursLeft = prHoursLeft - hours
            updates3()
        }

        if(sender == s4 && prHoursLeft != 0.0){
            var hours  = Double(s4.value)
            prHoursLeft = prHoursLeft - hours
            updates4()
        }
        
        if(sender == s5 && prHoursLeft != 0.0){
            var hours  = Double(s5.value)
            prHoursLeft = prHoursLeft - hours
            updates5()
        }
    }
    
    
    
    

    func updates1(){
        
        s1.isEnabled = false;
        s2.isEnabled = true;

        if(prHoursLeft > 0) {

        s2.minimumValue = 0.0
        s2.maximumValue = Float(prHoursLeft)
        
        s3.minimumValue = 0.0
        s3.maximumValue = Float(prHoursLeft)
        
        s4.minimumValue = 0.0
        s4.maximumValue = Float(prHoursLeft)
        
        s5.minimumValue = 0.0
        s5.maximumValue = Float(prHoursLeft)
        }
    }
    
    func updates2() {
//    s1.minimumValue = 0.0
//    s1.maximumValue = Float(prHoursLeft)
//
        s2.isEnabled = false;
        s3.isEnabled = true;


        if(prHoursLeft > 0) {
    s3.minimumValue = 0.0
    s3.maximumValue = Float(prHoursLeft)
    
    s4.minimumValue = 0.0
    s4.maximumValue = Float(prHoursLeft)
    
    s5.minimumValue = 0.0
    s5.maximumValue = Float(prHoursLeft)
    }
        }
    func updates3(){
        s3.isEnabled = false;
        s4.isEnabled = true;
        
        if(prHoursLeft > 0) {
        s4.minimumValue = 0.0
        s4.maximumValue = Float(prHoursLeft)
        
        s5.minimumValue = 0.0
                s5.maximumValue = Float(prHoursLeft)  }}
    
    func updates4(){
        s4.isEnabled = false;
        s5.isEnabled = true;

             if(prHoursLeft > 0) {
        s5.minimumValue = 0.0
        s5.maximumValue = Float(prHoursLeft)
        }}
        
    func updates5() {
      s5.isEnabled = false;

    }
    
//    @IBAction func slider1(_ sender: Any, forEvent event: UIEvent) {
//        print("hello")
//    }
        
        
    

//    @IBAction func slider1(_ sender: UISlider, forEvent event: UIEvent) {
//
////        var selects1 = sender.value
////        prHoursLeft = prHoursLeft - Double(selects1)
//
//            goal1label.text = String(Int(sender.value)) + " hrs/wk and " + String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ) + "% "
//        updates1(sender: s1)
//    }
//
    
    @IBAction func sl1action(_ sender: UISlider, forEvent event: UIEvent) {
        updates1(sender: s1)
    }
    
    @IBAction func sl2action(_ sender: UISlider, forEvent event: UIEvent) {
        updates1(sender: s2)
    }
    
    @IBAction func sl3action(_ sender: UISlider, forEvent event: UIEvent) {
        updates1(sender: s3)

    }
    
    @IBAction func sl4action(_ sender: UISlider, forEvent event: UIEvent) {
        updates1(sender: s4)
    }
    @IBAction func sl5action(_ sender: UISlider, forEvent event: UIEvent) {
        updates1(sender: s5)
    }
    
    @IBAction func slider1(_ sender: UISlider) {
        
        goal1label.text = String(Int(round(sender.value))) + " hrs/wk and " + String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ) + "% "
      //  updates1(sender: s1)
    }
    
    
    
    @IBAction func slider2(_ sender: UISlider) {
        goal2label.text = String(Int(round(sender.value))) + " hrs/wk and " + String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ) + "% "
      //  updates1(sender: s2)
    }
   
//
//        var used = (((sender.value) / Float(prHours)) * 100)
//        var us = percentTotal - Double(used)
//        us = Double(String(format:"%.2f", percentLeft))!
//        us = prHours * Double(((100 - used) / 100))
//        us = Double(String(format:"%.2f", prHoursLeft))!
//        prHoursLeft = prHoursLeft - us

    
//
//    @IBAction func slider1(_ sender: UISlider) {
//        //print(prHours)
//        var used = (((sender.value) / Float(prHours)) * 100)
//        var us = percentTotal - Double(used)
//        us = Double(String(format:"%.2f", percentLeft))!
//        us = prHours * Double(((100 - used) / 100))
//        us = Double(String(format:"%.2f", prHoursLeft))!
//        prHoursLeft = prHoursLeft - us
//
//        print(prHoursLeft)
//        print("hrs left, per left: ")
//        print(percentLeft)
//
//        //print(String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ))
//
//        goal1label.text = String(Int(sender.value)) + " hrs/wk and " + String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ) + "% "
//
//        updates1()
//
//    }
//
//    @IBAction func slider2(_ sender: UISlider) {
//        var used = (((sender.value) / Float(prHours)) * 100)
//        percentLeft = percentLeft - Double(used)
//
//        var us = percentTotal - Double(used)
//        us = Double(String(format:"%.2f", percentLeft))!
//        us = prHours * Double(((100 - used) / 100))
//        us = Double(String(format:"%.2f", prHoursLeft))!
//        prHoursLeft = prHours - us
//
//        goal2label.text = String(Int(sender.value)) + " hrs/wk and " + String((Double((sender.value)) / prHours) * 100) + "% "
//
//        updates2()
//
//    }
//
    @IBAction func slider3(_ sender: UISlider) {
//        var used = (((sender.value) / Float(prHours)) * 100)
//        var us = percentTotal - Double(used)
//        us = Double(String(format:"%.2f", percentLeft))!
//        us = prHours * Double(((100 - used) / 100))
//        us = Double(String(format:"%.2f", prHoursLeft))!
//        prHoursLeft = prHours - us
//
//
//        goal3label.text = String(Int(sender.value)) + " hrs/wk and " + String((Double((sender.value)) / prHours) * 100) + "% "
//        updates3()
        goal3label.text = String(Int(round(sender.value))) + " hrs/wk and " + String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ) + "% "
        //updates1(sender: s3)
    }
//
    @IBAction func slider4(_ sender: UISlider) {
//        var used = (((sender.value) / Float(prHours)) * 100)
//        var us = percentTotal - Double(used)
//        us = Double(String(format:"%.2f", percentLeft))!
//        us = prHours * Double(((100 - used) / 100))
//        us = Double(String(format:"%.2f", prHoursLeft))!
//        prHoursLeft = prHours - us
//
//        goal4label.text = String(Int(sender.value)) + " hrs/wk and " + String((Double((sender.value)) / prHours) * 100) + "% "
//
//        updates4()
        goal4label.text = String(Int(round(sender.value))) + " hrs/wk and " + String(format:"%.2f", (((sender.value) / Float(prHours)) * 100) ) + "% "
        //updates1(sender: s4)
    }

    @IBAction func slider5(_ sender: UISlider) {
//        var used = (((sender.value) / Float(prHours)) * 100)
//        var us = percentTotal - Double(used)
//        us = Double(String(format:"%.2f", percentLeft))!
//        us = prHours * Double(((100 - used) / 100))
//        us = Double(String(format:"%.2f", prHoursLeft))!
//        prHoursLeft = prHours - us
//
//        goal5label.text = String(Int(sender.value)) + " hrs/wk and " + String((Double((sender.value)) / prHours) * 100) + "% "
//
//        updates5()
        goal5label.text = String(Int(round(sender.value))) + " hrs/wk and " + String(format:"%.0f", (((sender.value) / Float(prHours)) * 100) ) + "% "
        //updates1(sender: s5)

    }
//
    override func viewDidLoad() {
s2.isEnabled = false;
s3.isEnabled = false;
s4.isEnabled = false;
s5.isEnabled = false;
        s1.minimumValue = 0.0
        s1.maximumValue = Float(prHoursLeft)
        
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    
    }
    
    override func viewDidAppear(_ animated: Bool) {


        
        prHours = Double(168 - Int(exHours))
        prLabel.text = String(prHours) + " Productive Hours"
        prHoursLeft = prHours
        
        s1.minimumValue = 0.0
        s1.maximumValue = Float(prHoursLeft)
        
        s2.minimumValue = 0.0
        s2.maximumValue = Float(prHoursLeft)
        
        s3.minimumValue = 0.0
        s3.maximumValue = Float(prHoursLeft)
        
        s4.minimumValue = 0.0
        s4.maximumValue = Float(prHoursLeft)
        
        s5.minimumValue = 0.0
        s5.maximumValue = Float(prHoursLeft)
        
    }

}
