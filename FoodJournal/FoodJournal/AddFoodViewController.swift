//
//  AddFoodViewController.swift
//  FoodJournal
//
//  Created by BridgeLabz on 03/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {

    @IBOutlet weak var ratingControl: UISegmentedControl!
    @IBOutlet weak var restaurantTextField: UITextField!
    //declaring the object of FoodTableViewController
    var foodViewcontrollerObj:FoodTableViewController?
    
    @IBOutlet weak var foodTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addFoodButtonPressed(sender: AnyObject) {
        let newFoodName=foodTextField.text
        let newRestaurantName=restaurantTextField.text
        
        
        var rating="OK"
        if(ratingControl.selectedSegmentIndex==0){
        rating="good"
        }else if(ratingControl.selectedSegmentIndex==1){
            rating="bad"
        }
        let  firstFoodDictionary: [String:String] = ["foodName": newFoodName!,"restaurentName": newRestaurantName!,"rating":rating]
        foodViewcontrollerObj!.addFood(firstFoodDictionary)
        
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
