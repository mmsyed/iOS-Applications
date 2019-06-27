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
   // var logged_or_signed = false
    
    static var logged_or_signed = false {
        didSet{
        }
    }
    

    @IBOutlet var top_label: UIImageView!

    @IBOutlet var username_field: UITextField!
    @IBOutlet var password_field: UITextField!
    
    @IBOutlet var login_button: UIButton!
    @IBOutlet var signup_button: UIButton!
    
    func create_alert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

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
        if (username_field.text != "" || password_field.text != "") {
            let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            
            activityIndicator.center = self.view.center
            
            activityIndicator.hidesWhenStopped = true
            
            activityIndicator.style = UIActivityIndicatorView.Style.gray
            
            view.addSubview(activityIndicator)
            
            activityIndicator.startAnimating()
            
            UIApplication.shared.beginIgnoringInteractionEvents()

        if (login_or_signup) {
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            signup_login()
          
        }
        else {
            PFUser.logInWithUsername(inBackground: username_field.text!, password: password_field.text!) { (user: PFUser?, error: Error?) -> Void in
                activityIndicator.stopAnimating()
                UIApplication.shared.endIgnoringInteractionEvents()
                
                if user != nil {
                    print("success login")
                    LoginViewController.logged_or_signed = true
                    self.performSegue(withIdentifier: "show_table", sender: self)

            }
                else{
                    LoginViewController.logged_or_signed = false
                    print("fail login")
                    self.create_alert(title: "Login failed", message: "Incorrect combination. Try again")

                }
            }}
//        }
//        if LoginViewController.logged_or_signed {
//            performSegue(withIdentifier: "loggedin", sender: nil)
//        }
         //   changeview()
    }
        else {
            create_alert(title: "Please try again.", message: "Username / Passowrd cannot be empty")
        }
    }
    
    func changeview() {
        if LoginViewController.logged_or_signed {
            performSegue(withIdentifier: "show_table", sender: self)
        }
    }
        
    func signup_login() {
        let user = PFUser()
        user.username = username_field.text!
        user.password = password_field.text!
        if (username_field.text != "" || password_field.text != "") {
        user.signUpInBackground {
            (succeeded: Bool, error: Error?) -> Void in
            if let error = error {
                LoginViewController.logged_or_signed = false
//                let errorString = error.userInfo["error"] as? String
                // Show the errorString somewhere and let the user try again.
                print(error)
                self.create_alert(title: "Error", message: "Could not sign up. Try again")

            } else {
                // Hooray! Let them use the app now.
                LoginViewController.logged_or_signed = true
                print("success")
                self.performSegue(withIdentifier: "show_table", sender: self)
            }
        }
    }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        if PFUser.current() != nil {
            performSegue(withIdentifier: "show_table", sender: self)
        }
        
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
