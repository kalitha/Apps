//
//  DataSource.swift
//  Training
//
//  Created by BridgeLabz Solutions LLP on 14/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    var names:[String] = []
    var prices:[String] = []
    var weights:[String] = []
    
    func populateData(){
        if let path = Bundle.main.path(forResource: "fruits", ofType: "data") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let price = dict["price"] as! String
                        let weight = dict["weight"] as! String
                        
                        let grocery = Grocery(name: name, price: price, weight:weight)
                        names.append(name)
                        prices.append(price)
                        weights.append(weight)
                        
                    }
                    }
                }
            }
        }

    }


