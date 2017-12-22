//
//  DetailsViewController.swift
//  iOSHomework
//
//  Created by alex on 12/21/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var japaneseTitle: UILabel!
    @IBOutlet weak var englishTitle: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var getAdult: UILabel!
    
    var getEnglishTitle = String()
    var getJapaneseTitle = String()
    var bannerImage = String()
    var adult = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        englishTitle.text = getEnglishTitle
        japaneseTitle.text = getJapaneseTitle
        GeneralAttributes.loadImageFromUrl(url: bannerImage, view: bannerImageView)
        getAdult.text =  "ssss"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        
        DispatchQueue.main.async(execute: {
            self.dismiss(animated: true) {
                print("finished")
            }})
        
    }
    


}
