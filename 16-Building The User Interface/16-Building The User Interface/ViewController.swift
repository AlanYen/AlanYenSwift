//
//  ViewController.swift
//  16-Building The User Interface
//
//  Created by AlanYen on 2016/4/28.
//  Copyright © 2016年 17Life. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    //
    // Custom cell
    //
    
    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    
    override func awakeFromNib() {
        
        profileImageView?.layer.cornerRadius = CGRectGetWidth((profileImageView?.frame)!) / 2.0
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    var headerTitle: NSArray = ["recents", "friends"]
    var dataSource: NSArray?
    var selectedIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Building The User Interface"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! DetailViewController
        if selectedIndexPath != nil {
            var info: Dictionary<String, String> = [:]
            if selectedIndexPath!.section == 0 {
                info = recents[selectedIndexPath!.row]
            }
            else if selectedIndexPath!.section == 1 {
                info = friends[selectedIndexPath!.row]
            }
            vc.infoData = info
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headerTitle.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return recents.count
        case 1:
            return friends.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle[section] as? String
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath) as? ContactCell
        
        var info = Dictionary<String, String>()
        if indexPath.section == 0 {
            info = recents[indexPath.row] 
        }
        else if indexPath.section == 1 {
            info = friends[indexPath.row]
        }
        
        if info["name"] != nil {
            cell?.nameLabel?.text = info["name"]
        }
        
        var url: NSURL? = nil
        if info["avatar"] != nil {
            url = NSURL(string: info["avatar"]!)
        }
        cell?.profileImageView!.sd_setImageWithURL(url, placeholderImage: UIImage(named: "profile"))
        
        return cell! as UITableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPath = indexPath
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("ToDetailViewController", sender: self)
    }
}