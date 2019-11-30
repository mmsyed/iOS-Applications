//
//  FirstViewController.swift
//  To Do List with Realm Database
//
//  Created by Mo Syed on 6/8/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table_view: UITableView!
    
    //global variables 
    var count: Int = 0 {
        didSet{
        }
    }
    
    
    var taskarray: [String] = [] {
        didSet{}
    }
   
    let realm = try! Realm()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(count)
        return count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell1")

        cell.textLabel?.text = taskarray[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let del = delAction(index: indexPath)
        
        return UISwipeActionsConfiguration(actions: [del])
    }
    
    //to delete a task
    func delAction(index: IndexPath)  -> UIContextualAction {
        
        let task = realm.objects(tasks.self)
        
        let action = UIContextualAction(style: .destructive, title: "delete") { (action, view, completion) in
            //delete
            try! self.realm.write {
                let item = task[index.row]
                self.realm.delete(item)
                self.viewDidAppear(true)
            }
        }
        action.backgroundColor = .red
    return action
    }

    //function adding to the realm database and updating UI, its called by the add button
    func add_task(task1: String) {
        
        let task_new = tasks()
        
        task_new.task_to_do = task1
        
        try! realm.write {
            realm.add(task_new)
        }

    }
    
    //used as a function to update view when deleted, added, or reloaded
    override func viewDidAppear(_ animated: Bool) {
        taskarray = []
        count = 0
        //table_view.color
        let task = realm.objects(tasks.self)

        //using realm to populate local arrays and count to be used in the tableview
        for t in task {
            let t1 = t.task_to_do
            taskarray.append(t1!)
            count = count + 1
        }
        print("finals")
        print(count)
        
        table_view.reloadData()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    



}
// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
