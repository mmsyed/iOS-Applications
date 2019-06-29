//
//  FeedViewController.swift
//  Instagram Clone
//
//  Created by Mo Syed on 6/28/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UITableViewController {
    
    var users = [String : String]()
    var comments = [String]()
    var usernames = [String]()
    var image_files = [PFFileObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get user data
        let query  = PFUser.query()
        query?.whereKey("username", notEqualTo: PFUser.current()?.username)
        
        query?.findObjectsInBackground(block: { (user_objects, error) in
            if let objects = user_objects {
                for user in objects {
                    if let user = user as? PFUser {
                        self.users[user.objectId!] = user.username!
                    }}}
            let followed_users = PFQuery(className: "Following")
            followed_users.whereKey("Follower", equalTo: PFUser.current()?.objectId)
            
            followed_users.findObjectsInBackground(block: { (objects, error) in
                if let followers = objects  {
                    for f in followers {
                        if let followed_user = f["following"] {
                            let data_query = PFQuery(className: "Post")
                            query?.whereKey("userID", equalTo: "followed_user")
                            query?.findObjectsInBackground(block: { (objects, error) in
                                if let posts = objects {
                                    for post in posts {
                                        //store the data so far
                                        self.comments.append(post["comment"] as! String)
                                self.usernames.append(self.users[post["userID"] as! String]!)
                                        
                                        self.image_files.append(post["image_File"] as! PFFileObject)
                                        
                                        self.tableView.reloadData()
                                    }
                                }
                            })
                            
                        }
                    }
                }})
        })
        self.tableView.reloadData()

    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(comments.count)
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    func get_feed() {

    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! FeedCellController
        
        cell.image_view.image = UIImage(named: "insta_logo.png")

//        cell.comment.text = comments[indexPath.row]
        cell.user_info.text = usernames[indexPath.row]
//         let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
//        cell.textLabel?.text = "checks"
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
