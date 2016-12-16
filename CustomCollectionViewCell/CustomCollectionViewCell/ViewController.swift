//
//  ViewController.swift
//  CustomCollectionViewCell
//
//  Created by BridgeLabz Solutions LLP on 05/12/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var names: [String] = ["RainDeer", "Parachute", "Penguins", "SeaLion", "House" ,"Colour"]
    var images: [String] = ["1.png", "2.png", "3.png", "4.png", "house.jpeg", "violet.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
       // return names.count
        
        return names.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell:ColvwCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColvwCollectionViewCell
        cell.name.text = names[indexPath.row]
        cell.image.image = UIImage(named: images[indexPath.row])
        
//        cell.contentView.layer.cornerRadius = 2.0
//        cell.contentView.layer.borderWidth = 1.0
//        cell.contentView.layer.borderColor = UIColor.clear.cgColor
//        cell.contentView.layer.masksToBounds = true;
        
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width:2.0,height: 2.0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.cornerRadius = 10
      //cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        
        cell.image.layer.shadowColor = UIColor.black.cgColor
        cell.image.layer.shadowOffset = CGSize(width:2.0,height: 2.0)
        cell.image.layer.shadowRadius = 3.0
        cell.image.layer.shadowOpacity = 1.0
        cell.image.layer.masksToBounds = false;
       


        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Cell\(indexPath.row)selected")
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

