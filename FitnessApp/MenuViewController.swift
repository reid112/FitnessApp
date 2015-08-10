//
//  MenuViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-07-28.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation

class MenuViewController: UITableViewController {
    
    var TableArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableArray = ["Home","Log Workout","Progress Photos", "Past Workouts", "Stats", "Settings"]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    

    
    
}