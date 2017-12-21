//
//  ViewController.swift
//  iOSHomework
//
//  Created by elaniin on 12/18/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import UIKit
import Alamofire
import Reachability
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableContainer: UITableView!
    var categories = ["Anime"]
    
    let reachability = Reachability()
    
    override func viewDidLoad() {
        General()
        
        
    }

}




/*Extending Viewcontroller as ViewDelegate*/
extension ViewController : UITableViewDelegate { }


/*Extending Viewcontroller as DataSource*/
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = GeneralAttributes.hexStringToUIColor(hex: "#303030")
        
        let headerLabel = UILabel(frame: CGRect(x: 30, y: 0, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.textColor = UIColor.white
        headerLabel.font = UIFont(name: "Verdana", size: 20)
        headerLabel.text = self.tableView(self.tableContainer, titleForHeaderInSection: section)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
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
    
    func General(){
        
        self.tableContainer.separatorStyle = .none
    }
    
   
    
    
}

