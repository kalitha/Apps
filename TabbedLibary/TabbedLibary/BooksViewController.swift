//
//  BooksViewController.swift
//  Library
//
//  Created by Bart Jacobs on 07/12/15.
//  Copyright © 2015 Envato Tuts+. All rights reserved.
//

import UIKit

class BooksViewController: UITableViewController {

    let CellIdentifier = "Cell Identifier"
    let SegueBookCoverViewController = "BookCoverViewController"
    
    var author: [String: AnyObject]!
    
    var books: [AnyObject] {
        if let books = author["Books"] as? [AnyObject] {
            return books
        } else {
            return [AnyObject]()
        }
    }
    
    // MARK: -
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = author["Author"] as? String {
            title = name
        }
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueBookCoverViewController {
            if let indexPath = tableView.indexPathForSelectedRow, let book = books[indexPath.row] as? [String: String]  {
                let destinationViewController = segue.destination as! BookCoverViewController
                destinationViewController.book = book
            }
        }
    }
    
    // MARK: -
    // MARK: Table View Data Source Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue Resuable Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        if let book = books[indexPath.row] as? [String: String], let title = book["Title"] {
            // Configure Cell
            cell.textLabel?.text = title
        }
        
        return cell;
    }
    
    // MARK: -
    // MARK: Table View Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Perform Segue
        performSegue(withIdentifier: SegueBookCoverViewController, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
