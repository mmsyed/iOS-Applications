//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Mo Syed on 6/22/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gameScore = PFObject(className:"GameScore")
        gameScore["score"] = 1337
        gameScore["playerName"] = "Sean Plott"
        gameScore["cheatMode"] = false
        gameScore.saveInBackground {
            (success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
                print("success")
            } else {
                print("erROR")
                // There was a problem, check error.description
            }
        }
    }


}

