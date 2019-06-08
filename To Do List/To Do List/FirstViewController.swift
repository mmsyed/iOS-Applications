//
//  FirstViewController.swift
//  To Do List
//
//  Created by Mo Syed on 6/7/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!
    var tasks:NSMutableArray = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell1")
        
        var cell_label = ""
        if let cell_label1 = tasks[indexPath.row] as? String {
            cell_label = cell_label1
        }
        cell.textLabel?.text = cell_label
        
        return cell
        
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tasks_obj = UserDefaults.standard.object(forKey: "tasks_saved")
        
        if let task = tasks_obj as? NSMutableArray {
            tasks = task
           // tasks.addObjects(from: [new_task_entered.text!])
        }
        
       // UserDefaults.standard.set(tasks, forKey: "tasks_saved")
        
        
    }


}

