//
//  LoginVC.swift
//  ProtocolsAndDelegates
//
//  Created by BridgeLabz Solutions LLP on 02/12/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.username.transform = CGAffineTransform(translationX:300, y: 0)
        UIView.animate(withDuration: 2, animations: {
            self.username.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
            
        
        

    
    
//    
//    UIView.animate(withDuration: 0.25, animations: {
//    self.username.transform = CGAffineTransform(translationX: 100, y: 0)
//    }, completion: {finished in
//    UIView.animate(withDuration: 1, animations: {
//    self.username.transform = CGAffineTransform(translationX: 0, y: 0)
//    }, completion: nil)
//    
//    })
    
    
    }
}


