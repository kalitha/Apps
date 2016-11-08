//
//  DataSource.swift
//  FruitDiet
//
//  Created by BridgeLabz Solutions LLP on 08/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import Foundation

class DataSource {
    
    init() {
        populateData()
    }
    
    var fruits:[Fruit] = []
    var groups:[String] = []
    
    
    func numbeOfRowsInEachGroup(index: Int) ->Int {
    return fruitsInGroup(index).count
    }
    
    func numberOfGroups() ->Int {
    return groups.count
    }
    
    
    
    func gettGroupLabelAtIndex(index: Int) ->String {
    return groups[index]
    }
    
    // MARK:- Populate Data from plist
    
    func populateData() {
        if let path = NSBundle.mainBundle().pathForResource("fruits", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict["name"] as! String
                        let group = dict["group"] as! String
                        
                        let fruit = Fruit(name: name, group: group)
                        if !groups.contains(group){
                            groups.append(group)
                        }
                        fruits.append(fruit)
                    }
                }
            }
        }
    }
    
    // MARK:- FruitsForEachGroup
    
    func fruitsInGroup(index: Int) -> [Fruit] {
    let item = groups[index]
    let filteredFruits = fruits.filter { (fruit: Fruit) -> Bool in
    return fruit.group == item
    }
    return filteredFruits
    }
}