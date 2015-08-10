//
//  ViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-07-28.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let moc:NSManagedObjectContext = SwiftCoreDataHelper.managedObjectContext()
    
    let days = ["Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7"]
    let exercisesPerDay = [4, 0, 5, 0, 3, 0, 0]
    var planParts:NSMutableArray = NSMutableArray()
    
    var nextWorkoutDay = Int(arc4random_uniform(7))

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    
    
    
    @IBAction func startButtonClicked(sender: UIButton) {
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("LogWorkoutView") as! LogWorkoutsViewController
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        self.revealViewController().setFrontViewController(navigationController, animated: true)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        LoadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        nextWorkoutDay = Int(arc4random_uniform(7))
    }
    
    func LoadData() {
        planParts.removeAllObjects()
        
        let results:NSArray = SwiftCoreDataHelper.fetchEntities(NSStringFromClass(PlanPart), withPredicate: nil, managedObjectContext: moc)
        
        for planPart in results {
            let p:PlanPart = planPart as! PlanPart
            
            let planPartDict:NSDictionary = ["day":p.day, "exercise":p.exercise, "sets":p.sets, "reps":p.reps]
            
            if p.day == nextWorkoutDay + 1 {
                self.planParts.addObject(planPartDict)
            }
        }
        
        self.tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.

        if planParts.count == 0 {
            return 1
        }
        
        return planParts.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeCell", forIndexPath: indexPath) as! UITableViewCell
        
        let count = exercisesPerDay[nextWorkoutDay]
        
        if count > 0 {
            let planPartDict:NSDictionary = planParts.objectAtIndex(indexPath.row) as! NSDictionary
            
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
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[nextWorkoutDay]
    }
    
    
    
}

