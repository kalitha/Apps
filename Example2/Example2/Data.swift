//
//  Data.swift
//  Example2
//
//  Created by Kalitha H N on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
import FirebaseDatabase
class Data: NSObject {
    
    var ref: FIRDatabaseReference!
    var  dataSourceObj : DataSource?
    
    var value = [NSDictionary]()// or var value = [[String:String]]()
    
    //creating the Model type array
    var arrayOfModel = [Details]() //or let arrayOfModel : [Details] = []
    
    init(obj:DataSource) {
        
        dataSourceObj=obj
    }
    func fetchData(){
        ref = FIRDatabase.database().reference()
        ref.child("data").observeSingleEvent(of: .value, with: { (snapshot) in
            
            // Getting array of dictionary
            self.value = (snapshot.value) as![ NSDictionary]
            for index in 0..<self.value.count{
                
                let valueAtEachIndex = self.value[index]
                let nameValue = valueAtEachIndex["name"] as! String
                let priceValue = valueAtEachIndex["price"] as! Int
                let weightValue = valueAtEachIndex["weight"] as! Int
                
                
                //adding the values at each ndex to object of model type
                let detailsObj = Details(name: nameValue, price: priceValue, weight: weightValue)
                self.arrayOfModel.append(detailsObj)
                
            }
            
            self.dataSourceObj?.fetchDataFromController(data: self.arrayOfModel as [Details])
            // we are writing self here because to differentiate that it is a global variable
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}
