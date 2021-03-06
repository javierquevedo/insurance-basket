//
//  Insurance.swift
//  InsuranceBasket
//
//  Created by Javier Quevedo on 10.12.17.
//  Copyright © 2017 Javier Quevedo. All rights reserved.
//

import Foundation

class Insurance {
    var category: String
    
    init (_ json:Dictionary<String,Any>) {
            if let categoryName = json["title"] as? String {
                let split:Array<String> = categoryName.split(separator: ":").map(String.init)
                if split.count > 0 {
                    self.category =  split[1].replacingOccurrences(of: " insurance", with: "")
                    return
                }
            }
        category = "Unknown"
    }
}


