//
//  FirstViewController.swift
//  Energize
//
//  Created by Mo Syed on 7/23/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var item_label: UILabel!
    @IBOutlet var item_image: UIImageView!
    @IBOutlet var item_qt: UITextField!
    var lastSelection: NSIndexPath!
    
    
    @IBOutlet var main_table: UITableView!
    var selected_items:[Int] =  []
    
    var items = ["Red Bull Single", "Red Bull 4 pack", "Red Bull 8 pack"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.item_label.text = items[indexPath.row]
         if (indexPath.row == 0) {
            cell.item_price.text = "$2.50"
        }
        if (indexPath.row == 1) {
            cell.item_price.text = "$7.24"
        }
        if (indexPath.row == 2) {
            cell.item_price.text = "$13.50"
        }
        
        return cell
        
    }
    
    
    @IBAction func get_total(_ sender: Any) {
        selected_items.removeAll()
        let size = (self.main_table.indexPathsForSelectedRows)?.count
//        print(size!)
            if (size != nil) {
        for number in 0...(size!-1)  {
    selected_items.append((self.main_table.indexPathsForSelectedRows![number][1]))
    }
        }
        
    }
    
    func calculate_total() {
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        main_table.reloadData()
        self.main_table.allowsMultipleSelection = true
        self.main_table.allowsMultipleSelectionDuringEditing = true
    }


}

