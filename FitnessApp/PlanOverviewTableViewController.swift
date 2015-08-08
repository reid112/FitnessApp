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
    
    var planParts:NSMutableArray = NSMutableArray()
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    @IBAction func doneButtonClicked(sender: AnyObject) {
        var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
        self.presentViewController(main, animated: false, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(animated: Bool) {
        LoadData()
    }
    
    func LoadData() {
        planParts.removeAllObjects()
        
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return planParts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("planPartCell", forIndexPath: indexPath) as! UITableViewCell

        let planPartDict:NSDictionary = planParts.objectAtIndex(indexPath.row) as! NSDictionary
        
        let day = planPartDict.objectForKey("day") as! Int
        let exercise = planPartDict.objectForKey("exercise") as! String
        let sets = planPartDict.objectForKey("sets") as! Int
        let reps = planPartDict.objectForKey("reps") as! Int
        
        cell.textLabel?.text = exercise
        cell.detailTextLabel?.text = "\(sets) sets of \(reps) reps"
        
        return cell
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
