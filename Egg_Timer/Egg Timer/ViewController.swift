//
//  ViewController.swift
//  Egg Timer
//
//  Created by Mo Syed on 6/6/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer();
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBAction func Play(_ sender: Any) {
        if (!timer.isValid) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.managetimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        timeLabel.text = "210"
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func minus10(_ sender: Any) {
        
        let current_time = Int(timeLabel.text!)
        if ((current_time!-10) >= 0) {
        timeLabel.text = String(current_time! - 10)
    }
    }
    
    @IBAction func add10(_ sender: Any) {
        let current_time = Int(timeLabel.text!)
        timeLabel.text = String(current_time! + 10)
    }
    
    
    @objc func managetimer() {
        let current_time = Int(timeLabel.text!)
        if ( current_time! > 0) {
            timeLabel.text = String(current_time! - 1)
        }
        else {
            timer.invalidate()
        }
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }}

