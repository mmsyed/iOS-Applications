//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Mo Syed on 6/11/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var check: UIButton!
    
    var user = 1 //start with cross
    var results = [0,0,0,0,0,0,0,0,0]
    var index = 0
    
    @IBAction func action_button(_ sender: AnyObject) {
       print(sender.tag!)
        index += 1
        if (results[sender.tag-1] == 0 && (!checkwin(board: results))) {
            results[sender.tag-1] = user
            if (user == 1) {
                sender.setImage((UIImage(named: "cross")), for: [])
                user = 2
                if (checkwin(board: results)) {
                    print("cross won")
                    create_alert(title: "Cross Won!", message: "Play again or quit")

                }
                else if (index == 9){
                    print("draw")
                    create_alert(title: "Game Draw", message: "Play again or quit")
                }
            }
            else {
                 sender.setImage((UIImage(named: "nought")), for: [])
                user = 1
                
                if checkwin(board: results) {
                    print("nought won")
                    create_alert(title: "Nought won", message: "Play again or quit")

                }
                else if (index == 9){
                    print("draw")
                    create_alert(title: "Game Draw", message: "Play again or quit")

                }
            }
        }
    }
    
    @IBAction func quit(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func restart(_ sender: Any) {
        reset()
    }
    
    func reset() {
        self.user = 1 //start with cross
        self.results = [0,0,0,0,0,0,0,0,0]
        self.index = 0
        for i in 1...9 {
            let button = self.view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    
    func checkwin(board: [Int]) -> Bool {
        let checks = [[0,1,2],[3,4,5],[6,7,8], [0,3,6],[1,4,7],[2,5,8], [0,4,8],[2,4,6]]
        for e in checks{
            if (board[e[0]] != 0 && board[e[0]] == board[e[1]] && board[e[1]] == board[e[2]]) {
                return true
            }
        }
        return false
    }
    
    func create_alert (title: String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Play again", style:UIAlertAction.Style.default, handler: {
            (action) in
            self.reset()
            alert.dismiss(animated: true, completion: nil)}))
        
        alert.addAction(UIAlertAction(title: "Quit", style:UIAlertAction.Style.default, handler: {
            (action) in
            exit(0)
            
        }
        ))
    self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

