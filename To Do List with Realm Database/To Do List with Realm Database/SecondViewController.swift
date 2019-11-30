//
//  SecondViewController.swift
//  To Do List with Realm Database
//
//  Created by Mo Syed on 6/8/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var text_view: UITextField!
    
    @IBAction func add_b(_ sender: Any) {
        let sendtask = FirstViewController()
        if (!(text_view.text == "")) {
            sendtask.add_task(task1: text_view.text!)
    }
        text_view.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.text_view.delegate = self

    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        self.text_view.delegate = self
//    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        text_view.resignFirstResponder()
        let send = FirstViewController()
        if (!(text_view.text == "")) {
            send.add_task(task1: text_view.text!)
        }
 
        return true
    }

}

