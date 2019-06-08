//
//  SecondViewController.swift
//  To Do List
//
//  Created by Mo Syed on 6/7/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var new_task_entered: UITextField!
    
   // var tasks:[String] = []
    var tasks:NSMutableArray = []
 
    @IBAction func add1(_ sender: Any) {
        let tasks_obj = UserDefaults.standard.object(forKey: "tasks_saved")
        
        if let task = tasks_obj as? NSMutableArray {
            tasks = task
            tasks.addObjects(from: [new_task_entered.text!])
        }
        else {
            tasks = [new_task_entered.text!]
        }
        
        UserDefaults.standard.set(tasks, forKey: "tasks_saved")
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UserDefaults.standard.set(tasks, forKey: "tasks_list")
}
}
