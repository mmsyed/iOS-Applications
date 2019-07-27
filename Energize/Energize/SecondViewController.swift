//
//  SecondViewController.swift
//  Energize
//
//  Created by Mo Syed on 7/23/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    let ref = FirstViewController()
    var total_price = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    func reciept() {
        var quantities = FirstViewController.quantities
        var selected_rows = FirstViewController.selected_items
        
        for row in selected_rows {
            if (row == 0) {
                total_price = 2.50 * (quantities[0])
            }
            if (row == 1) {
                total_price = 7.24 * quantities[1]
            }
                }
    }
}

