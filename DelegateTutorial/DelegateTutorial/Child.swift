//
//  Child.swift
//  DelegateTutorial
//
//  Created by BridgeLabz Solutions LLP on 01/12/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
protocol itemPassingDelegate {
    func itemAdded(item: String)
}

class Child: UIViewController {
    var delegate : itemPassingDelegate?
    
    @IBOutlet weak var txtLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnSubmit(_ sender: Any) {
        if(delegate != nil){
            if(txtLabel.text?.characters.count)! > 0{
                delegate?.itemAdded(item: txtLabel.text!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
