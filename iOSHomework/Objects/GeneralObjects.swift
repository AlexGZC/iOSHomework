//
//  SaveToken.swift
//  iOSHomework
//
//  Created by elaniin on 12/18/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import Foundation
import CoreData

struct AnimeModel { //Make some suitable name
    let id: String
    let title_romaji: String
    let title_english: String
    let title_japanese: String
    let type: String
    let start_date_fuzzy: Int?
    let end_date_fuzzy: Int?
    let season: String
    let description: String
    //let synonyms : Array<Any>
    //let logo: String
    //let descrip: String
    //let menu: String
    let image_url_sml: String
    let image_url_med: String
    let image_url_lge: String
    let image_url_banner: String
    let adult: Bool
    init(dictionary: [String:Any]) {
        self.id = dictionary["id"] as? String ?? "Default Id"
        self.title_romaji = dictionary["title_romaji"] as? String ?? "Default title_romaji"
        self.title_english = dictionary["title_english"] as? String ?? "Default title_english"
        self.title_japanese = dictionary["title_japanese"] as? String ?? "Default telefono"
        self.type = dictionary["telefono2"] as? String ?? "Default telefono"
        self.start_date_fuzzy = dictionary["facebook"] as? Int ?? 170801
        self.end_date_fuzzy = dictionary["twitter"] as? Int ?? 170801
        self.season = dictionary["instagram"] as? String ?? "Default district"
        self.description = dictionary["instagram"] as? String ?? "Default instagram"
        //self.synonyms = (dictionary["horarios"] as? [String])!
        //self.logo = dictionary["logo"] as? String ?? "Default rating"
        //self.descrip = dictionary["descripcion"] as? String ?? "Default descripcion"
        //self.menu = (dictionary["menu"] as? String)!
        self.image_url_sml = dictionary["image_url_sml"] as? String ?? "https://vignette.wikia.nocookie.net/r2da/images/4/46/Tumblr_static_i_love_anime_large.png/revision/latest?cb=20150922211250"
        self.image_url_med = dictionary["image_url_med"] as? String ?? "https://vignette.wikia.nocookie.net/r2da/images/4/46/Tumblr_static_i_love_anime_large.png/revision/latest?cb=20150922211250"
        
        self.image_url_lge = dictionary["image_url_lge"] as? String ?? "https://vignette.wikia.nocookie.net/r2da/images/4/46/Tumblr_static_i_love_anime_large.png/revision/latest?cb=20150922211250"
        
        self.image_url_banner = dictionary["image_url_banner"] as? String ?? dictionary["image_url_lge"] as! String
        self.adult = dictionary["adult"] as? Bool ?? false
    }
}



struct Details {

    var image_url_banner: String = String()
}

class Favourite: NSManagedObject {
    
    @NSManaged var image_url_banner: String
    
    var stop : Details {
        get {
            return Details(image_url_banner: self.image_url_banner)
        }
        set {
            self.image_url_banner = newValue.image_url_banner

        }
    }
}
