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
    @IBAction func addNewItem(_ sender: AnyObject) {
        let index = dataSource.addAndGetIndexForNewItem()
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.insertItems(at: [indexPath])

    }
    
    //MARK:- Editing
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        collectionView?.allowsMultipleSelection = editing
        toolBar.isHidden = !editing
    }
    
    @IBAction func deleteCells(_ sender: AnyObject) {
        
        var deletedFruits:[Fruit] = []
        
        let indexpaths = collectionView?.indexPathsForSelectedItems
        
        if let indexpaths = indexpaths {
            
            for item  in indexpaths {
                let cell = collectionView!.cellForItem(at: item )
                
                collectionView?.deselectItem(at: (item as? IndexPath)!, animated: true)
                // fruits for section
                let sectionfruits = dataSource.fruitsInGroup(item.section)
                deletedFruits.append(sectionfruits[item.row])
            }
            
            dataSource.deleteItems(deletedFruits)
            
            collectionView?.deleteItems(at: indexpaths)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate=self
        navigationItem.leftBarButtonItem = editButtonItem
        toolBar.isHidden = true

    }

    
    override func viewDidAppear(_ animated: Bool){
        if let indexPath = getIndexPathForSelectedCell() {
            highlightCell(indexPath, flag: false)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return dataSource.numbeOfRowsInEachGroup(section)
           }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIdentifier", for: indexPath) as! FruitCell
               let fruits: [Fruit] = dataSource.fruitsInGroup(indexPath.section)
        let fruit = fruits[indexPath.row]
        
        let name = fruit.name!
        
        cell.imageView.image = UIImage(named: name.lowercased())
        cell.caption.text = name.capitalized
        
        return cell
    }
    
    
func numberOfSections(in collectionView: UICollectionView) -> Int{
    return dataSource.groups.count
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        let headerView: FruitsHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! FruitsHeaderView
        
        headerView.sectionLabel.text = dataSource.gettGroupLabelAtIndex(indexPath.section)
        return headerView
    }
    
//func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let indexPath = getIndexPathForSelectedCell() {
            
            let fruit = dataSource.fruitsInGroup(indexPath.section)[indexPath.row]
            
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.fruit = fruit
        }
    }
        func getIndexPathForSelectedCell() -> IndexPath? {
            
            var indexPath:IndexPath?
            if collectionView.indexPathsForSelectedItems!.count > 0 {
                indexPath = collectionView.indexPathsForSelectedItems![0]
            }
            return indexPath
        }
    func highlightCell(_ indexPath : IndexPath, flag: Bool) {
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        if flag {
            cell?.contentView.backgroundColor = UIColor.purple
        } else {
            cell?.contentView.backgroundColor = nil
        }
    }
    
    // MARK:- Should Perform Segue
override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
    return !isEditing
    }
    
    }
//Highlight Selection

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        highlightCell(indexPath, flag: true)
    }


func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    highlightCell(indexPath, flag: false)
}
}

