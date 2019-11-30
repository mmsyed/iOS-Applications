//
//  PlanViewController.swift
//  productivity
//
//  Created by Mo Syed on 11/26/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import RealmSwift

class PlanViewController: UIViewController {
    
    let realm = try! Realm()

    
    @IBOutlet var prlabel: UILabel!
    @IBOutlet var g1label: UILabel!
    @IBOutlet var g3label: UILabel!
    @IBOutlet var g2label: UILabel!
    @IBOutlet var g4label: UILabel!
    @IBOutlet var g5label: UILabel!
    
    @IBOutlet var sleepLabel: UILabel!
    
    @IBOutlet var commuteLabel: UILabel!
    
    @IBOutlet var foodLabel: UILabel!
    
    @IBOutlet var g1hours: UILabel!
    @IBOutlet var g2hours: UILabel!
    @IBOutlet var g3hours: UILabel!
    @IBOutlet var g4hours: UILabel!
    @IBOutlet var g5hours: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        let goals = realm.objects(hourTracker.self)
        
        

        //using realm to populate local arrays and count to be used in the tableview
        for g in goals {
//            let t1 = t.task_to_do
//            taskarray.append(t1!)
//            count = count + 1
            
            prlabel.text = String(g.productiveHours)
            g1label.text = g.goal1
            g1hours.text = String(round(g.hours1))
              //  String(format:"%.2f", g.hours1)
            
            g2label.text = g.goal2
            g2hours.text = String(round(g.hours2))
            
            g3label.text = g.goal3
            g3hours.text = String(round(g.hours3))
            
            g4label.text = g.goal4
            g4hours.text = String(round(g.hours4))
            
            g5label.text = g.goal5
            g5hours.text = String(round(g.hours5))
            
            commuteLabel.text = String(g.commuteHours)
            sleepLabel.text = String(g.sleepHours)
            foodLabel.text = String(g.foodHours)
            
            print(g)
        }
    }
}
