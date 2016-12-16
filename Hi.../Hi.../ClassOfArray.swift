//
//  ClassOfArray.swift
//  Hi...
//
//  Created by BridgeLabz Solutions LLP on 15/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ClassOfArray: NSObject {
var data:[String] = ["hi..","hello...","bye..","good.."]
    
    func numberOfElements()->Int{
        return data.count
    }
    
    func valueAteachRow(i:Int)->String{
    
        var value :String
        value = data[i]
        return value
    }
}
