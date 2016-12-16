//
//  ViewController.swift
//  MyStore
//
//  Created by BridgeLabz Solutions LLP on 24/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tasks : [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
   override func viewWillAppear(_ animated: Bool) {
        //get data from coredata
        getData()
    //reload table view
    tableView.reloadData()
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if(task.isImportant){
            cell.textLabel?.text = "😱\(task.name!)"
        }else{
            cell.textLabel?.text = task.name!
        }
        
        return cell
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tasks.count
    }
    
    func getData(){
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
        tasks = try context.fetch(Task.fetchRequest())
        }catch{
            print("fetching failed")
        }
}

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do{
                tasks = try context.fetch(Task.fetchRequest())
            }catch{
                print("fetching failed")
            }
            
        }
        
       tableView.reloadData()
    }
}
