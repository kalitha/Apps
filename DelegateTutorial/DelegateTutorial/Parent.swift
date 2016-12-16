//
//  Parent.swift
//  DelegateTutorial
//
//  Created by BridgeLabz Solutions LLP on 01/12/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class Parent: UIViewController, itemPassingDelegate{
    @IBOutlet weak var addName: UILabel!
    @IBAction func btnAddItemPressed(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)//creating d object of main storyboard
        let childVC = mainStoryBoard.instantiateViewController(withIdentifier: "childid") as! Child
        
        childVC.delegate = self
        present(childVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func itemAdded(item:String){
        addName.text = item
    }
}

