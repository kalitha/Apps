//
//  ViewController.swift
//  Hi...
//
//  Created by BridgeLabz Solutions LLP on 15/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let classOfArrayObj=ClassOfArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   }


extension ViewController:UICollectionViewDataSource{
    //create no. of cells
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return classOfArrayObj.numberOfElements()
    }
    //data contained in cell is gven here
    //called when cell is created in mainstory board
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = ÷÷÷÷÷collectionView.dequeueReusab≥……………………………………leCell(withReuseIdentifier: "cellIdentifier", for: indexPath) ÷
//        if (indexPath.row==0) {
//            cell.label.text="hi..."
//        }
//        else if (indexPath.row==1){
//        cell.label.text="hello..."
//        }
//        else if (indexPath.row==2){
//            cell.label.text="bye..."
//        }
//
//        else{
//            cell.label.text="good..."
//        }
        
           // print(indexPath.row)
         //print(indexPath)
        
        cell.label.text = classOfArrayObj.valueAteachRow(i: indexPath.row)
                return cell
    
    }
}
≤

≤≤≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥≥
