//
//  Router.swift
//  iOSHomework
//
//  Created by alex on 12/20/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://anilist.co/api/"
    case getShopinfo(String)
    case getshopCategories()
    case getRestaurantsinfo(String)
    case getRestaurantcategories()
    case generalShopsinfo()
    case getEvents()
    case getAnimeList()
    case create([String: Any])
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .getShopinfo:
                return .get
            case .getshopCategories:
                return .get
                
            case .getRestaurantsinfo:
                return .get
            case .getRestaurantcategories:
                return .get
            case .generalShopsinfo:
                return .get
            case .getEvents:
                return .get
            case .getAnimeList:
                return .get
            case .create(_):
                return .post
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .getShopinfo:
                return nil
                
            case .getshopCategories:
                return nil
            case .getRestaurantsinfo(_):
                return nil
            case .getRestaurantcategories:
                return nil
            case .generalShopsinfo:
                return nil
            case .getEvents:
                return nil
            case .getAnimeList:
                return nil
            case .create(let params):
                return (params)
            }
        }()
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .getShopinfo(let id):
                relativePath = "tiendas/\(id)"
                
            case .getshopCategories:
                relativePath = "categorias-tiendas"
                
            case .getRestaurantsinfo(let id):
                relativePath = "restaurantes/\(id)"
            case .getRestaurantcategories:
                relativePath = "categorias-restaurantes"
            case .generalShopsinfo:
                relativePath = "all"
            case .getEvents:
                relativePath = "eventos"
            case .getAnimeList:
                relativePath = "browse/anime"
            case .create(_):
                relativePath = "auth/access_token"
            }
            var url = URL(string: Router.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}
