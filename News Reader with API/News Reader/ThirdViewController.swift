//
//  ThirdViewController.swift
//  News Reader
//
//  Created by Mo Syed on 6/19/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var ref = SecondViewController()
    @IBOutlet var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: SecondViewController.link)
        webview.loadRequest(URLRequest(url: url!))
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func check(_ sender: Any) {
        print(SecondViewController.link)
    }


}
