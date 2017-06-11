//
//  Table.swift
//  ClassProjectv1.1
//
//  Created by Eric Liu on 10/17/16.
//  Copyright © 2016 EricLiu. All rights reserved.
//

import Foundation
import UIKit

class Table : UITableViewController{
    
    var theArray = ["Charlie"]
    var identities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identities = ["Charlie"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
        cell.textLabel?.text=theArray[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theArray.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let Name = identities[indexPath.row]
        let vc = storyboard?.instantiateViewControllerWithIdentifier(Name)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
