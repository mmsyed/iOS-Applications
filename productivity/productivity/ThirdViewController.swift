//
//  ThirdViewController.swift
//  productivity
//
//  Created by Mo Syed on 11/18/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import RealmSwift

class ThirdViewController: UIViewController {
    @IBOutlet var sleepSlider: UISlider!
    @IBOutlet var commuteSlider: UISlider!
    @IBOutlet var foodSlider: UISlider!
    
    
    @IBOutlet var sleepLabel: UILabel!
    @IBOutlet var commuteLabel: UILabel!
    @IBOutlet var foodLabel: UILabel!
    
    var sleepHrs = Int()
    var commuteHrs = Int()
    var foodHrs = Int()


    
    var total: Int = 0 {
        didSet{
        }
    }

    var check = "test123"
    
    @IBAction func next(_ sender: Any) {
    }
    
    func update() {
    }
    
    
    @IBAction func sleepUpd(_ sender: UISlider) {
        sleepHrs = Int(sender.value)
        sleepLabel.text = String(Int(sender.value)) + " hrs/day"
    }
    
    @IBAction func commuteUpd(_ sender: UISlider) {
        commuteHrs = Int(sender.value)
        commuteLabel.text = String(Int(sender.value)) + " hrs/day"
 }
    
    @IBAction func foodUpd(_ sender: UISlider) {
        foodHrs = Int(sender.value)
        foodLabel.text = String(Int(sender.value)) + " hrs/day"
  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sleepHrs = Int(round(sleepSlider.value))
        commuteHrs = Int(round(commuteSlider.value))
        foodHrs = Int(round(foodSlider.value))
        performSegue(withIdentifier: "seg1", sender: self)

    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "seg1"){
        total = Int(sleepSlider.value) + Int(foodSlider.value) + Int(commuteSlider.value)
        
        let second = segue.destination as! SecondViewController
        
        second.exHours = total*7
        second.prHoursLeft = Double(total)*7
        
        second.sleepHours = Double(sleepHrs)*7
        second.commuteHours = Double(commuteHrs)*7
        second.foodHours = Double(foodHrs)*7
    }
    }
    

}
