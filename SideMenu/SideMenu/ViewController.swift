//
//  ViewController.swift
//  SideMenu
//
//  Created by BridgeLabz Solutions LLP on 05/12/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leadingCnstraint: NSLayoutConstraint!
    var menuShowing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
    }

    @IBAction func openMenu(_ sender: Any) {
        if(menuShowing){
        leadingCnstraint.constant = -150
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
            
        }
        else{
            leadingCnstraint.constant = 0
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        menuShowing = !menuShowing
    }
   
}

