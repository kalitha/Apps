//
//  FoodDetailVC.swift
//  FoodJournal
//
//  Created by BridgeLabz on 03/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class FoodDetailVC: UIViewController {
    var food=NSDictionary()
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
       //setting the foodname and restuarant name
        foodLabel.text=food.objectForKey("foodName")as? String
        restaurantLabel.text=food.objectForKey("restaurentName")as? String
        
        let foodRating=food.objectForKey("rating")as? String
        //unwrapping the optional
        if let unwrapped = foodRating{
            let foodRatingSentence="the food is \(unwrapped)"
            ratingLabel.text=foodRatingSentence

        }
        
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
