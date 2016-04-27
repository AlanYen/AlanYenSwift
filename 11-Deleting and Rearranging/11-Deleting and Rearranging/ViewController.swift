//
//  ViewController.swift
//  11-Deleting and Rearranging
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var editBarButton: UIBarButtonItem?
    var dataSource: NSMutableArray = []
    var dataIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< 20 {
            dataSource.addObject(String(format: "Test-%04d", i));
        }
        
        tableView?.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func editBarButtonClicked(sender: UIBarButtonItem) {
        
        if editBarButton?.title == "Edit" {
            editBarButton?.title = "Done"
            tableView?.setEditing(true, animated: true)
        }
        else {
            editBarButton?.title = "Edit"
            tableView?.setEditing(false, animated: true)
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
        let item : String = dataSource[indexPath.row] as! String
        cell.textLabel?.text = item
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
                dataSource.removeObjectAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let item : String = dataSource[sourceIndexPath.row] as! String
        dataSource.removeObjectAtIndex(sourceIndexPath.row)
        dataSource.insertObject(item, atIndex: destinationIndexPath.row)
        tableView.reloadData()
    }
}