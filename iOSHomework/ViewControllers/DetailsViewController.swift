//
//  DetailsViewController.swift
//  iOSHomework
//
//  Created by alex on 12/21/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import UIKit
import HCSStarRatingView
import SDWebImage
import SwiftyBeaver

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var japaneseTitle: UILabel!
    @IBOutlet weak var englishTitle: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var getAdult: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var starRating: HCSStarRatingView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var showPopularity: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    
    
    var getEnglishTitle = String()
    var getJapaneseTitle = String()
    var bannerImage = String()
    var adult = true
    var average = Double()
    var setRating = Int()
    var getDescription = String()
    var getPopularity = Int()
    var getStartDate = Int()
    var getendDate = Int()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        englishTitle.text = getEnglishTitle
        japaneseTitle.text = getJapaneseTitle
        bannerImageView.sd_setImage(with: URL(string: bannerImage), placeholderImage: UIImage(named: "placeholder.png"))
        
        if adult == true{
            getAdult.text =  "18"
  
        }else{
            getAdult.isHidden = true
        }
        
        if average <= 20{
            setRating = 1
        }else if average > 20 && average <= 40 {
            setRating = 2
        }else if average > 40 && average <= 65{
            setRating = 3
        }else if average > 65 && average <= 80{
            setRating = 4
            
        }else if average > 80 && average <= 100{
            setRating = 5
        }
        
        starRating.value = CGFloat(setRating)
        starRating.allowsHalfStars = true
        averageLabel.text = average.description
        descriptionTextView.text = getDescription
        showPopularity.text = getPopularity.description
        SwiftyBeaver.info(getPopularity.description)
        startDate.text = GeneralAttributes.arrangeUSFormat(strDate: getStartDate.description)
        endDate.text = GeneralAttributes.arrangeUSFormat(strDate: getendDate.description )
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        
        DispatchQueue.main.async(execute: {
            self.dismiss(animated: true) {
             
            }})
        
    }
    


}
