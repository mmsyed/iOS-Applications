//
//  SecondViewController.swift
//  Math Tables
//
//  Created by Mo Syed on 6/6/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var slider_value: UISlider!
    @IBOutlet weak var table_view: UITableView!
    
    @IBAction func slider_changed(_ sender: Any) {
        table_view.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell1")
        var output: String = String(Int(slider_value.value)) + " * " + String((indexPath.row + 1))
        
        cell.textLabel?.text = output + " = " + String(Int(slider_value.value) * (indexPath.row + 1))
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
