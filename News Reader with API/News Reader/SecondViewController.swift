//
//  SecondViewController.swift
//  News Reader
//
//  Created by Mo Syed on 6/19/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cat = "business"
    var country = "us"
    var json_res : JSON = ""
    var check1 = ""
    static var link: String = "" {
        didSet{
        }
    }
    
    var img_link: String = "" {
        didSet{
        }
    }
    
    static var url_link: String = "" {
        didSet{
        }
    }

    
    @IBOutlet var cell_title: UILabel!
    
    @IBOutlet var table1: UITableView!
//    let url_link : String = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (json_res["articles"].count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCellController
        cell.tag = indexPath.row
        
        cell.title2.text = ((self.json_res["articles"].array![indexPath.row])["title"]).string ?? "hell"
        
        cell.cell_img.downloadImage(from: (((self.json_res["articles"].array![indexPath.row])["urlToImage"]).string ?? ""))
        
        cell.setNeedsLayout()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SecondViewController.link = ((self.json_res["articles"].array![indexPath.row])["url"]).string ?? "hell"

            self.performSegue(withIdentifier: "seg", sender: self)
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (ViewController.selected_ctgry == "" && ViewController.selected_cntry == "")
        {   SecondViewController.url_link = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
        }
        else if ( ViewController.selected_cntry == "") {
            SecondViewController.url_link = "https://newsapi.org/v2/top-headlines?country=us&category=\(ViewController.selected_ctgry)&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
        }
        else if ( ViewController.selected_ctgry == "") {
            SecondViewController.url_link = "https://newsapi.org/v2/top-headlines?country=\(ViewController.selected_cntry)&category=business&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
        }
        else {
            SecondViewController.url_link = "https://newsapi.org/v2/top-headlines?country=\(ViewController.selected_cntry)&category=\(ViewController.selected_ctgry)&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
        }
        table1.reloadData()
        
    }
    

    
    @IBAction func check(_ sender: Any) {
        searchForUserAlamo()
        
    }
    
    func searchForUserAlamo() {
        Alamofire.request(SecondViewController.url_link).responseJSON{
            response in
            if let result_json = response.result.value{
                self.json_res = JSON(result_json)
//                self.check1 = ((self.json_res["articles"].array![1])["title"]).string ?? ""
//                print(self.check1)
//                print("kfkf")
//                for i in 1 ... 4 {
//                    print((self.json_res["articles"].array![i])["title"])
//                }
                
            }
        }
        
        table1.reloadData()
    }
    
    func get_articles() {
        //let url_link : String = "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(cat)&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // searchForUserAlamo()
        table1.reloadData()
    }
    

}

let imageCache = NSCache<NSString, UIImage>()


extension UIImageView {
    func downloadImage(from url: String) {
        
        if (url != "") {
        let url_req = URLRequest(url: URL(string: url)!)
        image = nil
            if let imageToCache = imageCache.object(forKey: url as NSString) {
                self.image = imageToCache
                return
            }

        let task = URLSession.shared.dataTask(with: url_req) {(data, response, error) in
            if (error != nil) {
                print("error")
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: url as NSString)
                self.image = imageToCache            }
}
task.resume()
        }} }

