//
//  SaveToken.swift
//  iOSHomework
//
//  Created by elaniin on 12/18/17.
//  Copyright © 2017 alexcontreras. All rights reserved.
//

import Foundation


struct getCategories {
    var categories: String = String()
    subscript(_ categories: String) -> String? {
        get {
            return categories == "categories" ? self.categories : nil
        }
    }
}

