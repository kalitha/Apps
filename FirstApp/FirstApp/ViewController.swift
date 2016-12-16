//
//  ViewController.swift
//  FirstApp
//
//  Created by BridgeLabz on 01/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBAction func clicked(_ sender: UIButton) {
        welcomeLabel.text="Go back"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

