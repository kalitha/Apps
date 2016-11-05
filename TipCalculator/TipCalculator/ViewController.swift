//
//  ViewController.swift
//  TipCalculator
//
//  Created by BridgeLabz on 01/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    
    
    @IBOutlet weak var tipLabel: UILabel!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         tipLabel.text="$0.00"
        totalLabel.text="$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages=[0.18,0.20,0.25]
       var tipPercentage=tipPercentages[tipControl.selectedSegmentIndex]
        
        
        let string = NSString(string: billField.text!)
   var billAmount=string.doubleValue
        var tip=billAmount*tipPercentage
        var total=billAmount+tip
        tipLabel.text="$\(tip)"
        totalLabel.text="$\(total)"

        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

