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
    let start_date_fuzzy: Int
    let end_date_fuzzy: Int
    let season: Int
    let description: String
    let synonyms : NSArray
    let adult: Bool
    let average_score : Double
    let popularity : Int
    //let logo: String
    //let descrip: String
    //let menu: String
    let image_url_sml: String
    let image_url_med: String
    let image_url_lge: String
    let image_url_banner: String
    
    init(dictionary: [String:Any]) {
        self.id = dictionary["id"] as? String ?? "Default Id"
        self.title_romaji = dictionary["title_romaji"] as? String ?? "Default title_romaji"
        self.title_english = dictionary["title_english"] as? String ?? "Default title_english"
        self.title_japanese = dictionary["title_japanese"] as? String ?? "Default telefono"
        self.type = dictionary["type"] as? String ?? "Default telefono"
        self.start_date_fuzzy = dictionary["start_date_fuzzy"] as? Int ?? 170801
        self.end_date_fuzzy = dictionary["end_date_fuzzy"] as? Int ?? 170801
        self.season = dictionary["season"] as? Int ?? 0
        self.description = dictionary["description"] as? String ?? "Anime by Alex Contreras"
        self.synonyms = (dictionary["synonyms"] as? NSArray)!
        
        self.adult = dictionary["adult"] as? Bool ?? false
        self.average_score = dictionary["average_score"] as? Double ?? 0.0
        self.popularity = dictionary["popularity"] as? Int ?? 0
        self.image_url_sml = dictionary["image_url_sml"] as? String ?? "https://vignette.wikia.nocookie.net/r2da/images/4/46/Tumblr_static_i_love_anime_large.png/revision/latest?cb=20150922211250"
        self.image_url_med = dictionary["image_url_med"] as? String ?? "https://vignette.wikia.nocookie.net/r2da/images/4/46/Tumblr_static_i_love_anime_large.png/revision/latest?cb=20150922211250"
        
        self.image_url_lge = dictionary["image_url_lge"] as? String ?? "https://vignette.wikia.nocookie.net/r2da/images/4/46/Tumblr_static_i_love_anime_large.png/revision/latest?cb=20150922211250"
        
        self.image_url_banner = dictionary["image_url_banner"] as? String ?? dictionary["image_url_lge"] as! String
        
    }
}





struct tokenParameters {
    let grant_type: String
    let client_id: String
    let client_secret: String

    var getToken:[String:Any] {
        get {
            return ["grant_type" : grant_type,
                    "client_id" : client_id,
                    "client_secret" : client_secret] as [String : Any]
        }
    }
    
    
    
}



