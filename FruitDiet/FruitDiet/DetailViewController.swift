//
//  DetailViewController.swift
//  FruitDiet
//
//  Created by Kalitha H N on 09/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var fruit:Fruit?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = fruit!.name?.capitalized
        imageView.image = UIImage(named: fruit!.name!.lowercased())
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
