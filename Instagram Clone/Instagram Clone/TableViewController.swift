//
//  TableViewController.swift
//  Instagram Clone
//
//  Created by Mo Syed on 6/26/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Parse

class TableViewController: UITableViewController {

    @IBOutlet var logout_button: UIBarButtonItem!
    var user_list = [""]
    
    @IBOutlet var table1: UITableView!
    
    @IBAction func logout_pressed(_ sender: Any) {
        PFUser.logOut()
        self.performSegue(withIdentifier: "seg_logout", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get data from the server
        let query = PFUser.query()
        query?.findObjectsInBackground(block: { (users, error) in
            if error != nil {
                print("error")
            }
            else if let users = users {
                self.user_list.removeAll()
                for object in users {
                    if let user = object as? PFUser{
                    print(user.username!)
                    self.user_list.append(user.username!)
                    }}
                self.tableView.reloadData()

            }
            for i in self.user_list {
                print(i)
            }
            })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return user_list.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
       cell.textLabel?.text = user_list[indexPath.row]
        
        //cell.textLabel?.text = "HELLO"
        
        return cell
    }


}
