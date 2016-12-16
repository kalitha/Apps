//
//  Details.swift
//  Example2
//
//  Created by Kalitha H N on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class Details: NSObject {
    var name: String?
    var price: Int?
    var weight: Int?
    
    init(name:String, price:Int,weight:Int){
        self.name=name
        self.price=price
        self.weight=weight
    }
}
