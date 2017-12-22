//
//  CategoryRow.swift
//  iOSHomework
//
//  Created by elaniin on 12/18/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

class CategoryRow : UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    var items = [AnimeModel]()
    var filterItems = [AnimeModel]()
    
    override func awakeFromNib() {
        let reachability = Reachability()!
        
        switch reachability.connection {
        case .wifi:
            DispatchQueue.main.async {
                self.alamofirePost()
            }
        case .cellular:
            DispatchQueue.main.async {
                self.alamofirePost()
            }
        case .none:
            var alert = UIAlertView(title: "Sin conexión", message: "Debes tener una conexión a Internet", delegate: nil, cancelButtonTitle: "OK")
            
            alert.show()
            
        
            
        }

    }

    
    
}

extension CategoryRow : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrRes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCell
       
        GeneralAttributes.loadImageFromUrl(url: items[indexPath.row].image_url_med.description, view: cell.imageView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(connected(_:)))
        cell.imageView.tag = indexPath.row
        cell.imageView.addGestureRecognizer(tapGestureRecognizer)
        cell.imageView.isUserInteractionEnabled = true
        return cell
    }
    
    @objc func connected(_ sender:AnyObject){
        print("you tap image number : \(sender.view.tag)")
         print(items[sender.view.tag].title_english.description)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popOverVC = storyboard.instantiateViewController(withIdentifier: "animeDetails") as! DetailsViewController
        popOverVC.getEnglishTitle = items[sender.view.tag].title_english.description
        popOverVC.getJapaneseTitle = items[sender.view.tag].title_japanese.description
        popOverVC.bannerImage = items[sender.view.tag].image_url_banner.description
        popOverVC.adult = items[sender.view.tag].adult

        self.window?.rootViewController?.present(popOverVC, animated: true , completion: nil)
    }
    
}





extension CategoryRow : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func alamofirePost() {
        let params: [String: Any] = ["grant_type": "client_credentials","client_id": "alexgcz-eccbk", "client_secret": "qTfhz0Z0v4hho2bweDhurQbM"]
        
        Alamofire.request(Router.create(params))
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling POST on /todos/1")
                    print(response.result.error!)
                    return
                }
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get object as JSON from API")
                    print("Error: \(String(describing: response.result.error))")
                    
                    return
                }
                // get and print the title
                guard let token = json["access_token"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("Token: " + token)
                self.getanime(token: token)
                
        }
    }
    
    
    func getanime(token:String){
        let url: String = "https://anilist.co/api/browse/anime"
        var request = URLRequest(url: NSURL(string: url)! as URL)
        
        // Your request method type Get or post etc according to your requirement
        request.httpMethod = "GET"
        
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Your required parameter in case of Post request
        
        GetAPIManager.Get(request, success: { (json) in
            
            let swiftvar = JSON(json)
            
            if let jsonvar = swiftvar.arrayObject{
                self.arrRes = jsonvar as! [[String:AnyObject]]
                
            }
            

            if let resData = swiftvar.arrayObject as? [[String: Any]] {
                
                self.items = resData.map(AnimeModel.init)
                
            }
            
            
            if self.arrRes.count > 0{
             self.collectionView.reloadData()
             
             }
        }) { (error) in
            
        }
    }
    
    
   
    
}
