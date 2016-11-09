//
//  ViewController.swift
//  FruitDiet
//
//  Created by Kalitha H N on 08/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {
    
    //creating instance of data source
    let dataSource = DataSource()

    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK:- Add Cell
    @IBAction func addNewItem(sender: AnyObject) {
        let index = dataSource.addAndGetIndexForNewItem()
        let indexPath = NSIndexPath(forItem: index, inSection: 0)
        collectionView.insertItemsAtIndexPaths([indexPath])

    }
    
    //MARK:- Editing
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView?.allowsMultipleSelection = editing
        toolBar.hidden = !editing
    }
    
    @IBAction func deleteCells(sender: AnyObject) {
        
        var deletedFruits:[Fruit] = []
        
        let indexpaths = collectionView?.indexPathsForSelectedItems()
        
        if let indexpaths = indexpaths {
            
            for item  in indexpaths {
                let cell = collectionView!.cellForItemAtIndexPath(item as! NSIndexPath)
                
                collectionView?.deselectItemAtIndexPath((item as? NSIndexPath)!, animated: true)
                // fruits for section
                let sectionfruits = dataSource.fruitsInGroup(item.section)
                deletedFruits.append(sectionfruits[item.row])
            }
            
            dataSource.deleteItems(deletedFruits)
            
            collectionView?.deleteItemsAtIndexPaths(indexpaths)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate=self
        navigationItem.leftBarButtonItem = editButtonItem()
        toolBar.hidden = true

    }

    
    override func viewDidAppear(animated: Bool){
        if let indexPath = getIndexPathForSelectedCell() {
            highlightCell(indexPath, flag: false)
        }
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if let indexPath = getIndexPathForSelectedCell() {
            
            let fruit = dataSource.fruitsInGroup(indexPath.section)[indexPath.row]
            
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.fruit = fruit
        }
    }
        func getIndexPathForSelectedCell() -> NSIndexPath? {
            
            var indexPath:NSIndexPath?
            if collectionView.indexPathsForSelectedItems()!.count > 0 {
                indexPath = collectionView.indexPathsForSelectedItems()![0]
            }
            return indexPath
        }
    func highlightCell(indexPath : NSIndexPath, flag: Bool) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        if flag {
            cell?.contentView.backgroundColor = UIColor.blackColor()
        } else {
            cell?.contentView.backgroundColor = nil
        }
    }
    
    // MARK:- Should Perform Segue
override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
    return !editing
    }
    
    }
//Highlight Selection

extension ViewController : UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        highlightCell(indexPath, flag: true)
    }


func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
    highlightCell(indexPath, flag: false)
}
}

