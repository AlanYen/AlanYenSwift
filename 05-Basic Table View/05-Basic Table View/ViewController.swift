//
//  ViewController.swift
//  05-Basic Table View
//
//  Created by AlanYen on 2016/4/26.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    var dataSource: NSArray = []
    var selectedTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Basic Table View"
        
        dataSource = ["IronMan", "SpiderMan", "BatMan"];
        tableView?.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc: DetailViewController = segue.destinationViewController as! DetailViewController
        vc.detail = selectedTitle
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let text: String? = (dataSource[indexPath.row] as? String)
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let text: String? = (dataSource[indexPath.row] as? String)
        selectedTitle = text
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("ToDetailViewController", sender: self)
    }
}