//
//  LogViewController.swift
//  productivity
//
//  Created by Mo Syed on 11/27/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import RealmSwift

class LogViewController: UIViewController {
    let realm = try! Realm()

    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var progressBar2: UIProgressView!
    @IBOutlet var progressBar3: UIProgressView!
    @IBOutlet var progressBar4: UIProgressView!
    @IBOutlet var progressBar5: UIProgressView!
    
    
    
    var oldValue1: Double = 0.0
    var oldValue2: Double = 0.0
    var oldValue3: Double = 0.0
    var oldValue4: Double = 0.0
    var oldValue5: Double = 0.0

    
    @IBOutlet var stepper1: UIStepper!
    @IBOutlet var stepper2: UIStepper!
    @IBOutlet var stepper3: UIStepper!
    @IBOutlet var stepper4: UIStepper!
    @IBOutlet var stepper5: UIStepper!
    
    @IBOutlet var goal1label: UILabel!
    @IBOutlet var goal2label: UILabel!
    @IBOutlet var goal3label: UILabel!
    @IBOutlet var goal4label: UILabel!
    @IBOutlet var goal5label: UILabel!
    
    var g1hours: Double = 0.0
    var g2hours: Double = 0.0
    var g3hours: Double = 0.0
    var g4hours: Double = 0.0
    var g5hours: Double = 0.0
    
    
    var g1hourscompleted: Double = 0.0
    var g2hourscompleted: Double = 0.0
    var g3hourscompleted: Double = 0.0
    var g4hourscompleted: Double = 0.0
    var g5hourscompleted: Double = 0.0
    
    
    
    @IBAction func st1(_ sender: UIStepper) {
        if(oldValue1 < stepper1.value){
        if(stepper1.value < g1hours) {
            let goals = realm.objects(hourTracker.self)
            g1hourscompleted += 1
            goal1label.text = "\(g1hourscompleted)h"+" / " + "\(g1hours)"
            
            try! realm.write {
                for g in goals{
                    g.goal1completed = g1hourscompleted
                }
            }
            progressBar.progress = Float(g1hourscompleted / g1hours)
                oldValue1 = oldValue1 + 1
            } }
            
        else{
            if(stepper1.value < g1hours) {
                let goals = realm.objects(hourTracker.self)
                g1hourscompleted -= 1
                goal1label.text = "\(g1hourscompleted)h"+" / " + "\(g1hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal1completed = g1hourscompleted
                    }
                }
                progressBar.progress = Float(g1hourscompleted / g1hours)
                    oldValue1 = oldValue1 - 1

            }
        }
    }
    
    @IBAction func st2(_ sender: UIStepper) {
        if(oldValue2 < stepper2.value){
            if(stepper2.value < g2hours) {
                let goals = realm.objects(hourTracker.self)
                g2hourscompleted += 1
                goal2label.text = "\(g2hourscompleted)h"+" / " + "\(g2hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal2completed = g2hourscompleted
                    }
                }
                progressBar2.progress = Float(g2hourscompleted / g2hours)
                oldValue2 = oldValue2 + 1
            } }
            
        else{
            if(stepper2.value < g2hours) {
                let goals = realm.objects(hourTracker.self)
                g2hourscompleted -= 1
                goal2label.text = "\(g2hourscompleted)h"+" / " + "\(g2hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal2completed = g2hourscompleted
                    }
                }
                progressBar2.progress = Float(g2hourscompleted / g2hours)
                oldValue2 = oldValue2 - 1
                
            }
        }}
    
    
    
    
    @IBAction func st3(_ sender: UIStepper) {
        if(oldValue3 < stepper3.value){
            if(stepper3.value < g3hours) {
                let goals = realm.objects(hourTracker.self)
                g3hourscompleted += 1
                goal3label.text = "\(g3hourscompleted)h"+" / " + "\(g3hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal3completed = g3hourscompleted
                    }
                }
                progressBar3.progress = Float(g3hourscompleted / g3hours)
                oldValue3 = oldValue3 + 1
            } }
            
        else{
            if(stepper3.value < g3hours) {
                let goals = realm.objects(hourTracker.self)
                g3hourscompleted -= 1
                goal3label.text = "\(g3hourscompleted)h"+" / " + "\(g3hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal3completed = g3hourscompleted
                    }
                }
                progressBar3.progress = Float(g3hourscompleted / g3hours)
                oldValue3 = oldValue3 - 1
                
            }
        }}
    
    @IBAction func st4(_ sender: UIStepper) {
        if(oldValue4 < stepper4.value){
            if(stepper4.value < g4hours) {
                let goals = realm.objects(hourTracker.self)
                g4hourscompleted += 1
                goal4label.text = "\(g4hourscompleted)h"+" / " + "\(g4hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal4completed = g4hourscompleted
                    }
                }
                progressBar4.progress = Float(g4hourscompleted / g4hours)
                oldValue4 = oldValue4 + 1
            } }
            
        else{
            if(stepper4.value < g4hours) {
                let goals = realm.objects(hourTracker.self)
                g4hourscompleted -= 1
                goal4label.text = "\(g4hourscompleted)h"+" / " + "\(g4hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal4completed = g4hourscompleted
                    }
                }
                progressBar4.progress = Float(g4hourscompleted / g4hours)
                oldValue4 = oldValue4 - 1
                
            }
        }}
    @IBAction func st5(_ sender: UIStepper) {
        if(oldValue5 < stepper5.value){
            if(stepper5.value < g5hours) {
                let goals = realm.objects(hourTracker.self)
                g5hourscompleted += 1
                goal5label.text = "\(g5hourscompleted)h"+" / " + "\(g5hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal5completed = g5hourscompleted
                    }
                }
                progressBar5.progress = Float(g5hourscompleted / g5hours)
                oldValue5 = oldValue5 + 1
            } }
            
        else{
            if(stepper5.value < g5hours) {
                let goals = realm.objects(hourTracker.self)
                g5hourscompleted -= 1
                goal5label.text = "\(g5hourscompleted)h"+" / " + "\(g5hours)"
                
                try! realm.write {
                    for g in goals{
                        g.goal5completed = g5hourscompleted
                    }
                }
                progressBar5.progress = Float(g5hourscompleted / g5hours)
                oldValue5 = oldValue5 - 1
                
            }
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //stepper1.minimumValue = 0.0
        //stepper1.maximumValue =
        let goals = realm.objects(hourTracker.self)

        for g in goals {
            g1hours = round(g.hours1)
            g2hours = round(g.hours2)
            g3hours = round(g.hours3)
            g4hours = round(g.hours4)
            g5hours = round(g.hours5)
            
            g1hourscompleted = round(g.goal1completed)
            g2hourscompleted = round(g.goal2completed)
            g3hourscompleted = round(g.goal3completed)
            g4hourscompleted = round(g.goal4completed)
            g5hourscompleted = round(g.goal5completed)

            
        }
        
        stepper1.minimumValue = g1hourscompleted
        stepper1.maximumValue = g1hours
        oldValue1 = stepper1.value;

        progressBar.setProgress(Float(g1hourscompleted / g1hours) , animated: true)
        progressBar.transform = CGAffineTransform(scaleX: 1, y: 4)

        stepper2.minimumValue = g2hourscompleted
        stepper2.maximumValue = g2hours
        oldValue2 = stepper2.value;
        
        progressBar2.setProgress(Float(g2hourscompleted / g2hours) , animated: true)
        progressBar2.transform = CGAffineTransform(scaleX: 1, y: 4)
        
        stepper3.minimumValue = g3hourscompleted
        stepper3.maximumValue = g3hours
        oldValue3 = stepper3.value;
        
        progressBar3.setProgress(Float(g3hourscompleted / g3hours) , animated: true)
        progressBar3.transform = CGAffineTransform(scaleX: 1, y: 4)

        stepper4.minimumValue = g4hourscompleted
        stepper4.maximumValue = g4hours
        oldValue4 = stepper4.value;
        
        progressBar4.setProgress(Float(g4hourscompleted / g4hours) , animated: true)
        progressBar4.transform = CGAffineTransform(scaleX: 1, y: 4)

        
        stepper5.minimumValue = g5hourscompleted
        stepper5.maximumValue = g5hours
        oldValue5 = stepper5.value;
        
        progressBar5.setProgress(Float(g5hourscompleted / g5hours) , animated: true)
        progressBar5.transform = CGAffineTransform(scaleX: 1, y: 4)
        
        goal1label.text = "\(g1hourscompleted)h"+" / " + "\(g1hours)"
        goal2label.text = "\(g2hourscompleted)h"+" / " + "\(g2hours)"

        goal3label.text = "\(g3hourscompleted)h"+" / " + "\(g3hours)"

        goal4label.text = "\(g4hourscompleted)h"+" / " + "\(g4hours)"

        goal5label.text = "\(g5hourscompleted)h"+" / " + "\(g5hours)"

        
    }

}
