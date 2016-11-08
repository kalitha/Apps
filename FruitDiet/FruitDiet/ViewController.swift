//
//  ViewController.swift
//  FruitDiet
//
//  Created by BridgeLabz Solutions LLP on 08/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {
    
    //creating instance of data source
    let dataSource = DataSource()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return dataSource.numbeOfRowsInEachGroup(section)
           }
    

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier", forIndexPath: indexPath) as! FruitCell
        //cell.backgroundColor = UIColor.Color()
        let fruits: [Fruit] = dataSource.fruitsInGroup(indexPath.section)
        let fruit = fruits[indexPath.row]
        
        let name = fruit.name!
        
        cell.imageView.image = UIImage(named: name.lowercaseString)
        cell.caption.text = name.capitalizedString
        
        return cell
    }
    
    
func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
    return dataSource.groups.count
    }
    
    //
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        let headerView: FruitsHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! FruitsHeaderView
        
        headerView.sectionLabel.text = dataSource.gettGroupLabelAtIndex(indexPath.section)
        return headerView
    }
    
//func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
//    }
    
    }

