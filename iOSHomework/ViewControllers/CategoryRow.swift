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
import AlamofireImage

class CategoryRow : UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func awakeFromNib() {
        alamofirePost()
    }
}

extension CategoryRow : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrRes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //alamofirePost()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as! VideoCell
        
        var dict = arrRes[(indexPath as NSIndexPath).row]
        print()
        
        loadImageFromUrl(url: dict["image_url_med"] as! String, view: cell.imageView)
        return cell
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
                    print("didn't get todo object as JSON from API")
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
            if self.arrRes.count > 0{
             self.collectionView.reloadData()
             
             }
        }) { (error) in
            
        }
    }
    
    
    func loadImageFromUrl(url: String, view: UIImageView){
        
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        let task = URLSession.shared.dataTask(with: url as URL) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data)
                    
                    view.image = image
                    
                    
                })
            }
        }
        
        // Run task
        task.resume()
    }
    
}
