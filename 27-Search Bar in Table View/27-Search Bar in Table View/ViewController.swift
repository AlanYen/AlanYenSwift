//
//  ViewController.swift
//  27-Search Bar in Table View
//
//  Created by AlanYen on 2016/5/20.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var searchController: UISearchController!
    var searchResultDataSource = [String]()
    var dataSource = [String]()
    var shouldShowSearchResults: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        // Reference:
        // http://www.appcoda.com.tw/custom-search-bar-tutorial/
        //
        
        self.title = "Search Bar in Table View"
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        
        for i in 0..<200 {
            dataSource.append(String(format: "This is %d", i))
        }
        
        configureSearchController()
    }
    
    func configureSearchController() {
        
        // Initialize and perform a minimum configuration to the search controller.
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type a number (0-199) here..."
        searchController.searchBar.keyboardType = UIKeyboardType.EmailAddress
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        // Place the search bar view to the tableview headerview.
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if shouldShowSearchResults {
            return searchResultDataSource.count
        }
        else {
            return dataSource.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if shouldShowSearchResults {
            cell.textLabel?.text = searchResultDataSource[indexPath.row]
        }
        else {
            cell.textLabel?.text = dataSource[indexPath.row]
        }
        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if searchController.searchBar.text == nil {
            return
        }
        
        if searchController.searchBar.text!.characters.count == 0 {
            return
        }
        
        // Filter the data array and get only those countries that match the search text.
        searchResultDataSource = dataSource.filter({ (contentString: String) -> Bool in
            
            if let searchString = searchController.searchBar.text {
                if contentString.rangeOfString(searchString) != nil {
                    print("ContentString String: \(contentString) find \(searchString)")
                    return true
                }
            }
            return false
        })
        
        // Reload the tableview.
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
        shouldShowSearchResults = true
        searchResultDataSource = []
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        shouldShowSearchResults = false
        searchResultDataSource = []
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        
        searchController.active = false
        searchController.searchBar.endEditing(true)
    }
}
