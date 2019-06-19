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

    @IBOutlet var table1: UITableView!
    let url_link : String = "https://newsapi.org/v2/top-headlines?country=us&category=sport&apiKey=d5ad515718da4adfb0ac7a22e7e7dbaa"
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (json_res["articles"].count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell1")
    cell.textLabel?.text = ((self.json_res["articles"].array![indexPath.row])["title"]).string ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SecondViewController.link = ((self.json_res["articles"].array![indexPath.row])["url"]).string ?? "hell"

            self.performSegue(withIdentifier: "seg", sender: self)
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  searchForUserAlamo()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func check(_ sender: Any) {
        searchForUserAlamo()
        
    }
    
    func searchForUserAlamo() {
        Alamofire.request(url_link).responseJSON{
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
        table1.reloadData()
    }
    

}
