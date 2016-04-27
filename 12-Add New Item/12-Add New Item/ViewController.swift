//
//  ViewController.swift
//  12-Add New Item
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var addBarButton: UIBarButtonItem?
    var dataSource: NSMutableArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add New Item"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc: DetailViewController = segue.destinationViewController as! DetailViewController
        vc.dataSource = self.dataSource
    }
    
    @IBAction func addBarButtonClicked(sender: UIBarButtonItem) {
        
        self.performSegueWithIdentifier("ToDetailViewController", sender: self)
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