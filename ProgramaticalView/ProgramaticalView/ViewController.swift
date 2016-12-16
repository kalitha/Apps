//
//  ViewController.swift
//  ProgramaticalView
//
//  Created by BridgeLabz Solutions LLP on 13/12/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var DynamicView=UIView(frame: CGRect(x: 0, y: 0, width: 425, height: 725))
        DynamicView.backgroundColor=UIColor.green
        DynamicView.layer.cornerRadius=25
        DynamicView.layer.borderWidth=2
        self.view.addSubview(DynamicView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

