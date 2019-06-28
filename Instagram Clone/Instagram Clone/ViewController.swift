//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Mo Syed on 6/22/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var image_button: UIButton!
  
    @IBOutlet var image_view: UIImageView!
    @IBOutlet var comment_field: UITextField!
    
    @IBAction func post_button(_ sender: Any) {
        if let img = image_view.image  {
            let new_post = PFObject(className: "Post")
            new_post["comment"] = comment_field.text!
            new_post["userID"] = PFUser.current()?.objectId
//            if let img_data = UIImage.pngData(img){
//                let img_file = PFFileObject(name: "image", data: img_data)
//                new_post["image_File"] = img_file
//            }
    }
    }
    @IBAction func img_button_pressed(_ sender: Any) {
        let img_picker = UIImagePickerController()
        img_picker.delegate = self
        img_picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        img_picker.allowsEditing = false
        self.present(img_picker, animated: true, completion: nil)
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image_view.image = img
        }
        else {
            print("error")
        }
        self.dismiss(animated: true, completion: nil)
    }
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


