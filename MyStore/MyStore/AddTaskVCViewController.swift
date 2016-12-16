//
//  AddTaskVCViewController.swift
//  MyStore
//
//  Created by BridgeLabz Solutions LLP on 24/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class AddTaskVCViewController: UIViewController {

    
    @IBOutlet weak var text: UITextField!
    
    @IBOutlet weak var isImp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Task refers to the entity in core data
        let task = Task(context: context)
        task.name = text.text
        task.isImportant = isImp.isOn
        
        //save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //returning to navgtn contrllr aftr addin task in addtaskvc
        navigationController?.popViewController(animated: true)
        
    }


}
