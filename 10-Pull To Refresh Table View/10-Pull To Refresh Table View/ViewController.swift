//
//  ViewController.swift
//  10-Pull To Refresh Table View
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    var refreshControl: UIRefreshControl!
    var dataSource: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pull To Refresh Table View"
        
        // Initialize data
        dataSource.addObject("Test-0001")

        // Setup UI
        tableView?.tableFooterView = UIView(frame: CGRectZero)
        addRefreshControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRefreshControl() {
        
        // UIRefreshControl
        if refreshControl == nil {
            refreshControl = UIRefreshControl.init()
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
            refreshControl.addTarget(self,
                                     action: #selector(ViewController.refresh),
                                     forControlEvents: UIControlEvents.ValueChanged)
            tableView?.addSubview(refreshControl!)
        }
    }
    
    func refresh() {

        // beginRefreshing
        self.refreshControl.beginRefreshing()
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))),
                       dispatch_get_main_queue())
        {
            
            // Generate new data
            let count: Int = self.dataSource.count
            self.dataSource.addObject(String(format: "Test-%04d", (count + 1)))
            
            // Reload tableView
            self.tableView?.reloadData()
            
            // endRefreshing
            self.refreshControl.endRefreshing()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        return cell
    }
}