//
//  Grocery.swift
//  Training
//
//  Created by BridgeLabz Solutions LLP on 14/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class Grocery: NSObject {
    var name:String?
    var price:String?
    var weight:String?
    
    init(name: String, price: String, weight:String) {
        self.name = name
        self.price = price
        self.weight = weight
    }


}
