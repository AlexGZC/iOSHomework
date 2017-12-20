//
//  ViewController.swift
//  iOSHomework
//
//  Created by elaniin on 12/18/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {
    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    override func viewDidLoad() {
        loginUser()
    }

}

/*Extending Viewcontroller as ViewDelegate*/
extension ViewController : UITableViewDelegate { }


/*Extending Viewcontroller as DataSource*/
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
     
        return cell
    }
    
    func loginUser() {
        
        var code:String?
        var accessToken:String?
        
        let path:String = "https://anilist.co/api/auth/access_token?"
        
        let parameters:[String:String] = ["grant_type": "client_credentials","client_id": "alexgcz-eccbk", "client_secret": "qTfhz0Z0v4hho2bweDhurQbM"]
        let headers:[String:String] = ["Content-Type": "application/x-www-form-urlencoded","Accept": "application/json"]
        
        GetAPIManager.Post(path, params: parameters as [String : AnyObject], success: { (json) in
            
            print(json["access_token"])s
        }) { (error) in
            
        }
    }
    
}
