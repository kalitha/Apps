//
//  FoodTableViewController.swift
//  FoodJournal
//
//  Created by Kalitha H N on 02/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    //declaring food array which consists of dictionary elements
    var foodArray = [NSDictionary]()
    
    func addFood(food: NSDictionary){
        //updating array with dictionary
        foodArray.append(food)
        //to display the changes in tableview
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(saveData(_:)), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
        if(NSFileManager.defaultManager().fileExistsAtPath(self.plistPath())){
            foodArray = NSArray(contentsOfFile: plistPath()) as! [NSDictionary]
            
        }else{
        let firstFoodDictionary: [String:String] = ["foodName": "masala dosa","restaurentName": "Dosa Corner",]
        
        foodArray.append(firstFoodDictionary)
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodArray.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //accesing row number
        let rowNumber=indexPath.row
        
//        let food=foodArray[rowNumber]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        let foodDictionary = foodArray[rowNumber]
        
        let food=foodDictionary.objectForKey("foodName") as! String
        let restaurant=foodDictionary.objectForKey("restaurentName") as! String
        // Configure the cell...
        cell.textLabel?.text = food
            cell.detailTextLabel?.text=restaurant
        
        print("table view is asking for cell :\(indexPath.row)")
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            foodArray.removeAtIndex(indexPath.row)
            print("deleting item")
        
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable
        return true
    }
    */
    
    
    func plistPath() -> String{
        let homeDirectory=NSHomeDirectory()
        let filePath=homeDirectory.stringByAppendingString("/Documents/food.plist")
        return filePath
        }
    
    //used to save data when we get the notification
    func saveData(notification:NSNotification) -> Void {
        
        let upadatedArray:NSArray = foodArray
        let filePath=self.plistPath()
        upadatedArray.writeToFile(filePath, atomically: true)
    }
    
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if ((segue.identifier)=="AddFoodSegue"){
            //creating obj of destination
        let addFoodViewControllerObj = segue.destinationViewController as! AddFoodViewController
            
        addFoodViewControllerObj.foodViewcontrollerObj=self
        }
        //setting food dictionary in FoodTableVC before the segue to FoodDetailVC
        else if((segue.identifier)=="FoodDetailSegue"){
            //selecting particular row by using tableview since it will be the same as array
        let selectedRow=tableView.indexPathForSelectedRow
        
        let selectedFood=foodArray[(selectedRow?.row)!]
            //getting FoodDetailVC by using destinationViewController property
        let foodDetailVCObj=segue.destinationViewController as! FoodDetailVC
       foodDetailVCObj.food=selectedFood
            
        }
    }
    

}
