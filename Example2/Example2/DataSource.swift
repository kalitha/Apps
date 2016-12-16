//
//  DataSource.swift
//  Example2
//
//  Created by Kalitha H N on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    //declaring object of ViewController
    var viewControllerObj : ViewController?
    
    //declaring object of Data
    var dataObj : Data?
    var array = [Details]()
    
    
    init(obj: ViewController){
        super.init()
        viewControllerObj = obj
        //assigning Data class to object dataObj
        dataObj = Data(obj: self)
    }
    
    func fetchNumberOfRows()->Int{
        if(array.count==0){
            dataObj?.fetchData()
        }
        else{
            return array.count
        }
        return 0//control will ome here when the array is empty,it says tht d array has 0 rows
    }
    
    func fetchDataFromController(data:[Details]){
        
        array = data  //updating the array which was empty earlier
        viewControllerObj?.reload()
    }
    
    func contentAtEachRow(i:Int)->[Details]{
       var contentInIndex = [Details]()
      contentInIndex = [array[i]]
        return contentInIndex
    }
}
