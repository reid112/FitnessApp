//
//  PlanOverviewTableViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-08.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import UIKit
import CoreData

class PlanOverviewTableViewController: UITableViewController {

    
    let moc:NSManagedObjectContext = SwiftCoreDataHelper.managedObjectContext()
    
    let days = ["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7"]
    let exercisesPerDay = [4, 0, 5, 0, 3, 0, 0]
    var planParts:NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    @IBAction func doneButtonClicked(sender: AnyObject) {
        var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
        self.presentViewController(main, animated: false, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadData()
    }
    
    func LoadData() {
        planParts.removeAllObjects()
        
        var curDay = 1
        var count = 0
        
        let results:NSArray = SwiftCoreDataHelper.fetchEntities(NSStringFromClass(PlanPart), withPredicate: nil, managedObjectContext: moc)
        
        for planPart in results {
            let p:PlanPart = planPart as! PlanPart
            
            let planPartDict:NSDictionary = ["day":p.day, "exercise":p.exercise, "sets":p.sets, "reps":p.reps]
            
            planParts.addObject(planPartDict)
        }
        
        self.tableView.reloadData()
    }



    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return days.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.

        if exercisesPerDay[section] == 0 {
            return 1
        }
        
        return exercisesPerDay[section]
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("planPartCell", forIndexPath: indexPath) as! UITableViewCell

        let count = exercisesPerDay[indexPath.section]
        
        if count > 0 {
            var row = 0, sectionRow = 0
            
            for var index = 0; index < indexPath.section; ++index {
                row = row + exercisesPerDay[index]
            }
            
            row = row + indexPath.row
            
            let planPartDict:NSDictionary = planParts.objectAtIndex(row) as! NSDictionary
            
            let exercise = planPartDict.objectForKey("exercise") as! String
            let sets = planPartDict.objectForKey("sets") as! Int
            let reps = planPartDict.objectForKey("reps") as! Int
            
            cell.textLabel?.text = exercise
            cell.detailTextLabel?.text = "\(sets) sets of \(reps) reps"
        } else {
            cell.textLabel?.text = "[Off Day]"
            cell.detailTextLabel?.text = " "
        }
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
