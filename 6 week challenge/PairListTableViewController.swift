//
//  PairListTableViewController.swift
//  6 week challenge
//
//  Created by Daniel Lee on 11/18/15.
//  Copyright © 2015 Daniel Lee. All rights reserved.
//

import UIKit

class PairListTableViewController: UITableViewController {
    
    let pairCell = "pairCell"


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var numberOfSections: Int
        if EntryController.sharedController.entries.count % 2 == 0 {
            numberOfSections = EntryController.sharedController.entries.count / 2
        } else {
            numberOfSections = (EntryController.sharedController.entries.count / 2) + 1
        }
        return numberOfSections
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pair \(section)"
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfSections: Int
        if EntryController.sharedController.entries.count % 2 == 0 {
            numberOfSections = EntryController.sharedController.entries.count / 2
        } else {
            numberOfSections = (EntryController.sharedController.entries.count / 2) + 1
        }

        if section == (numberOfSections-1) {
            return 1
        } else {
            return 2
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("pairCell", forIndexPath: indexPath)

        let entry = EntryController.sharedController.randomEntries[indexPath.row + indexPath.section * 2]
        
        
        cell.textLabel?.text = entry.title
        
        return cell
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
