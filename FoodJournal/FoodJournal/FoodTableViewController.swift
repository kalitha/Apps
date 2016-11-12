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
    
    func addFood(_ food: NSDictionary){
        //updating array with dictionary
        foodArray.append(food)
        //to display the changes in tableview
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(saveData(_:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        
        if(FileManager.default.fileExists(atPath: self.plistPath())){
            foodArray = NSArray(contentsOfFile: plistPath()) as! [NSDictionary]
            
        }else{
        let firstFoodDictionary: [String:String] = ["foodName": "masala dosa","restaurentName": "Dosa Corner",]
        
        foodArray.append(firstFoodDictionary as NSDictionary)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodArray.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //accesing row number
        let rowNumber=indexPath.row
        
//        let food=foodArray[rowNumber]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let foodDictionary = foodArray[rowNumber]
        
        let food=foodDictionary.object(forKey: "foodName") as! String
        let restaurant=foodDictionary.object(forKey: "restaurentName") as! String
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            foodArray.remove(at: indexPath.row)
            print("deleting item")
        
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
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
        let filePath=homeDirectory + "/Documents/food.plist"
        return filePath
        }
    
    //used to save data when we get the notification
    func saveData(_ notification:Notification) -> Void {
        
        let upadatedArray:NSArray = foodArray as NSArray
        let filePath=self.plistPath()
        upadatedArray.write(toFile: filePath, atomically: true)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if ((segue.identifier)=="AddFoodSegue"){
            //creating obj of destination
        let addFoodViewControllerObj = segue.destination as! AddFoodViewController
            
        addFoodViewControllerObj.foodViewcontrollerObj=self
        }
        //setting food dictionary in FoodTableVC before the segue to FoodDetailVC
        else if((segue.identifier)=="FoodDetailSegue"){
            //selecting particular row by using tableview since it will be the same as array
        let selectedRow=tableView.indexPathForSelectedRow
        
        let selectedFood=foodArray[(selectedRow?.row)!]
            //getting FoodDetailVC by using destinationViewController property
        let foodDetailVCObj=segue.destination as! FoodDetailVC
       foodDetailVCObj.food=selectedFood
            
        }
    }
    

}
