//
//  DetailsViewController.swift
//  iOSHomework
//
//  Created by alex on 12/21/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import UIKit
import HCSStarRatingView

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var japaneseTitle: UILabel!
    @IBOutlet weak var englishTitle: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var getAdult: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var starRating: HCSStarRatingView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var getEnglishTitle = String()
    var getJapaneseTitle = String()
    var bannerImage = String()
    var adult = true
    var average = Double()
    var setRating = Int()
    var getDescription = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        englishTitle.text = getEnglishTitle
        japaneseTitle.text = getJapaneseTitle
        GeneralAttributes.loadImageFromUrl(url: bannerImage, view: bannerImageView)
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
