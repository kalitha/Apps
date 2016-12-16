//
//  ViewController.swift
//  Training
//
//  Created by BridgeLabz Solutions LLP on 14/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var ref: FIRDatabaseReference!
    
    let dataSource = DataSource()
    
    var value : NSArray = []
    
    //let ref = FIRDatabase.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        ref = FIRDatabase.database().reference()
        print("printing reference:",ref)
        //data is a part of the url
        let data=ref.child("data")
        //calling firebase
        ref.child("data").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
             self.value = (snapshot.value as? NSArray)!
            
            self.collectionView.reloadData()
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        print("printing data:",data)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}//these 2 methods will be called whenever the collectionview is created
extension ViewController : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        let variable = value.count
        return value.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! AddDetails
     print(value[indexPath.row])
        var dict : NSDictionary
        
       dict = value[indexPath.row] as! NSDictionary
        
        cell.name.text = dict["name"] as! String
        cell.price.text = dict["price"] as! String
        cell.weight.text = dict["weight"] as! String
        return cell
    }

}

