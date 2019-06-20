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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let url = URL(string: SecondViewController.link)
        if (url != nil) {
            webview.loadRequest(URLRequest(url: url!))
        }
    }
    
    @IBAction func check(_ sender: Any) {
        print(SecondViewController.link)
    }


}
