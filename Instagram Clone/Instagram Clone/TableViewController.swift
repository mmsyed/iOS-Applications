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
    var user_object_id = [""]
    var is_following = ["" : false]
    var refresh: UIRefreshControl = UIRefreshControl()
    
    @IBOutlet var table1: UITableView!
    
    @IBAction func logout_pressed(_ sender: Any) {
        PFUser.logOut()
        self.performSegue(withIdentifier: "seg_logout", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check_and_update()
        
        refresh.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresh.addTarget(self, action: #selector(TableViewController.check_and_update), for: UIControl.Event.valueChanged)
        tableView.addSubview(refresh)
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
        if let follows_or_not = is_following[user_object_id[indexPath.row]] {
            if follows_or_not{
                cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            }}
        
        return cell
    }
    
    
    @objc func check_and_update() {
        //get data from the server
        let query = PFUser.query()
        //users cannot follow themselves
        query?.whereKey("username", notEqualTo: PFUser.current()?.username!)
        query?.findObjectsInBackground(block: { (users, error) in
            if error != nil {
                print("error")
            }
            else if let users = users {
                self.user_list.removeAll()
                self.user_object_id.removeAll()
                self.is_following.removeAll()
                for object in users {
                    if let user = object as? PFUser{
                        print(user.username!)
                        self.user_list.append(user.username!)
                        self.user_object_id.append(user.objectId!)
                        
                        let query = PFQuery(className: "Following")
                        query.whereKey("Follower", equalTo: PFUser.current()?.objectId)
                        query.whereKey("Following", equalTo: user.objectId!)
                        query.findObjectsInBackground(block: { (obj, error) in
                            if error == nil{
                                if let obj = obj {
                                    if obj.count > 0{
                                        self.is_following[user.objectId!] = true
                                    }
                                    else {
                                        self.is_following[user.objectId!] = false
                                    }
//                                    self.tableView.reloadData()
                                    if self.user_list.count == self.is_following.count {
                                        self.tableView.reloadData()
                                        self.refresh.endRefreshing()  }

                                }
                            }
                            else {
                                print("error")  }  })  }}
//                if self.user_list.count == self.is_following.count {
//                    self.tableView.reloadData()
//                    self.refresh.endRefreshing()  }
            for i in self.user_list {
                print(i)
            }
            for i in self.user_object_id {
                print(i)
            }
            dump(self.is_following)
                
            }}
            )}
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let cell = tableView.cellForRow(at: indexPath)
        if let follows_or_not = is_following[user_object_id[indexPath.row]] {
            if follows_or_not{
                is_following[user_object_id[indexPath.row]] = false
                cell!.accessoryType = UITableViewCell.AccessoryType.none
                let query = PFQuery(className: "Following")
                query.whereKey("Follower", equalTo: PFUser.current()?.objectId)
                query.whereKey("Following", equalTo: user_object_id[indexPath.row])
                query.findObjectsInBackground(block: { (objects, error) in
                    if error == nil{
                        if let objects = objects {
                            for obj in objects {
                                obj.deleteInBackground()
                            }
                        }}
                    else {
                        print("error")
                    }
                })
            }
            else {
                is_following[user_object_id[indexPath.row]] = true
                cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
                let users_following = PFObject(className: "Following")
                users_following["Follower"] = PFUser.current()?.objectId
                users_following["Following"] = user_object_id[indexPath.row]
                users_following.saveInBackground()

                
                
            }
        }
    }
}
