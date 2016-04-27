//
//  ViewController.swift
//  14-Jumpbar
//
//  Created by AlanYen on 2016/4/27.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    var headerTitle = [String]()
    var dataSource: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sticky Section Headers"
        
        for i in 0 ..< 26 {
            
            let myChar: CChar = (65 + i)
            let x: String = String(format: "%c", myChar)
            headerTitle.append(x)
            
            let tmp: NSMutableArray = []
            for j in 0 ..< 4 {
                tmp.addObject(String(format: "%@-%04d", x, j))
            }
            dataSource.addObject(tmp)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section]
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return headerTitle
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let sectionDataSource: NSArray = dataSource[indexPath.section] as! NSArray
        cell.textLabel?.text = sectionDataSource[indexPath.row] as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        let temp = headerTitle as NSArray
        return temp.indexOfObject(title)
    }
}
