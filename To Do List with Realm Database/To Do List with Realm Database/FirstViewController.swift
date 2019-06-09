//
//  FirstViewController.swift
//  To Do List with Realm Database
//
//  Created by Mo Syed on 6/8/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import RealmSwift

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
//        var tasks_list = tasks()
//        tasks_list.task_to_do = "check "
//
//       try! realm.write {
//            realm.add(tasks_list)
//        }
            let task = realm.objects(tasks.self)
            print(task)
        
        try! realm.write {
            let item = task[2]
            realm.delete(item)
            
        }
        
        for t in task {
            let t1 = t.task_to_do
            print(t1!)
        }
    }
    


}

