//
//  LoginViewController.swift
//  Instagram Clone
//
//  Created by Mo Syed on 6/25/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var login_or_signup = true //true when login, false when sigup
    
    @IBOutlet var top_label: UIImageView!
    @IBOutlet var username_fiels: UITextField!
    @IBOutlet var password_field: UITextField!
    
    @IBOutlet var login_button: UIButton!
    @IBOutlet var signup_button: UIButton!
    
    @IBAction func login_button_pressed(_ sender: Any) {
        if (login_or_signup) {
            login_or_signup = false
            signup_button.setTitle("Log in", for: [])
            login_button.setTitle("Sign up", for: [])
        }
        else {
            login_or_signup = true
            signup_button.setTitle("Sign up", for: [])
            login_button.setTitle("Log in", for: [])
        }
    }
    
    @IBAction func signup_button_pressed(_ sender: Any) {
        
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
