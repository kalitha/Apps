//
//  ViewController.swift
//  Example2
//
//  Created by Kalitha H N  on 16/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var dataSourceObj : DataSource?
    var value : [Details]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSourceObj = DataSource(obj: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func reload(){
        self.collectionView.reloadData()
    }
    

}
extension ViewController: UICollectionViewDataSource{
    //prints no. of cells
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
     return (dataSourceObj?.fetchNumberOfRows())!//returns no. of rows returnd by fetchNumberOfRows method
    }
    
    //prints the data in each cell
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! Cell

        let dict=dataSourceObj?.contentAtEachRow(i: indexPath.row)
        
        //cell.name.text=dict?["name"] as! String
        //cell.price.text=dict?["price"] as! String?
        //cell.weight.text=dict?["weight"] as! String?
        return cell
    }
}

