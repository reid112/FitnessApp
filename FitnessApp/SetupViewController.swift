//
//  SetupViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-04.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import CoreData

class SetupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let moc:NSManagedObjectContext = SwiftCoreDataHelper.managedObjectContext()
    
    var agePickerView:UIPickerView! = UIPickerView()
    var heightPickerView:UIPickerView! = UIPickerView()
    var weightPickerView:UIPickerView! = UIPickerView()
    var tpwPickerView:UIPickerView = UIPickerView()
    var goalsPickerView:UIPickerView = UIPickerView()
    
    var selectedAge = 0
    var selectedFeet = 0
    var selectedInches = 0
    var selectedWeight = 0
    var selectedTpw = 0
    var selectedGoals = 0
    
    var selectedFeetString = Enums.HeightFeet.Four.description
    var selectedInchesString = Enums.HeightInches.One.description
    
    
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var goals: UITextField!
    @IBOutlet weak var timesPerWeek: UITextField!
    @IBOutlet weak var giveMeAPlanButton: UIButton!
    
    
    
    @IBAction func GiveMeAPlanClicked(sender: UIButton) {
        
        var user: User = SwiftCoreDataHelper.insertManagedObject(NSStringFromClass(User), managedObjectConect: moc) as! User
            
        user.gender = NSNumber(integer: gender.selectedSegmentIndex)
        user.heightFeet = NSNumber(integer: selectedFeet)
        user.heightInches = NSNumber(integer: selectedInches)
        user.weight = NSNumber(integer: selectedWeight)
        user.goals = NSNumber(integer: selectedGoals)
        user.times_per_week = NSNumber(integer: selectedTpw)
        
        SwiftCoreDataHelper.saveManagedObjectContext(moc)
        
        CreatePlanForUser()
    }
    
    @IBAction func AgeEditing(sender: UITextField) {
        sender.inputView = agePickerView
    }
    
    @IBAction func HeightEditing(sender: UITextField) {
        sender.inputView = heightPickerView
    }
    
    @IBAction func WeightEditing(sender: UITextField) {
        sender.inputView = weightPickerView
    }
    
    @IBAction func GoalsEditing(sender: UITextField) {
        sender.inputView = goalsPickerView
    }
    
    @IBAction func TimesPerWeekEditing(sender: UITextField) {
        sender.inputView = tpwPickerView
    }
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if (pickerView == heightPickerView) {
            return 2
        } else {
            return 1
        }
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (pickerView == heightPickerView) {
            if (component == 0) {
                return Enums.HeightFeet.count.hashValue
            } else {
                return Enums.HeightInches.count.hashValue
            }
        } else if (pickerView == weightPickerView) {
            return Enums.Weight.count.hashValue
        } else if (pickerView == tpwPickerView) {
            return Enums.TimesPerWeek.count.hashValue
        } else if (pickerView == goalsPickerView) {
            return Enums.Goals.count.hashValue
        } else {
            return Enums.Age.count.hashValue
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView == heightPickerView) {
            if (component == 0) {
                return Enums.HeightFeet(rawValue: row)?.description
            } else {
                return Enums.HeightInches(rawValue: row)?.description
            }
        } else if (pickerView == weightPickerView) {
            return Enums.Weight(rawValue: row)?.description
        } else if (pickerView == tpwPickerView) {
            return Enums.TimesPerWeek(rawValue: row)?.description
        } else if (pickerView == goalsPickerView) {
            return Enums.Goals(rawValue: row)?.description
        } else {
            return Enums.Age(rawValue: row)?.description
        }
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == heightPickerView) {
            if (component == 0) {
                selectedFeetString = Enums.HeightFeet(rawValue: row)!.description
                selectedFeet = row
            }else {
                selectedInchesString = Enums.HeightInches(rawValue: row)!.description
                selectedInches = row
            }
            
            height.text = selectedFeetString + " " + selectedInchesString
        } else if (pickerView == weightPickerView) {
            weight.text = Enums.Weight(rawValue: row)?.description
            selectedWeight = row
        } else if (pickerView == tpwPickerView) {
            timesPerWeek.text = Enums.TimesPerWeek(rawValue: row)?.description
            selectedTpw = row
        } else if (pickerView == goalsPickerView) {
            goals.text = Enums.Goals(rawValue: row)?.description
            selectedGoals = row
        } else {
            age.text = Enums.Age(rawValue: row)?.description
            selectedAge = row
        }
        
    }
    
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    func CreatePlanForUser() {
        
        if (selectedGoals == Enums.Goals.LoseFat.rawValue) {
            SavePlanPart(1, sets: 3, reps: 15, exercise: "Bench Press")
            SavePlanPart(1, sets: 5, reps: 20, exercise: "Pushups")
            SavePlanPart(1, sets: 3, reps: 10, exercise: "Dips")
            SavePlanPart(1, sets: 3, reps: 20, exercise: "Tricep Push Downs")
            
            SavePlanPart(3, sets: 3, reps: 5, exercise: "Deadlifts")
            SavePlanPart(3, sets: 3, reps: 8, exercise: "Pullups")
            SavePlanPart(3, sets: 5, reps: 10, exercise: "Rows")
            SavePlanPart(3, sets: 5, reps: 25, exercise: "Dumbbell Curls")
            SavePlanPart(3, sets: 5, reps: 25, exercise: "Hammer Curls")
            
            SavePlanPart(5, sets: 5, reps: 15, exercise: "Squats")
            SavePlanPart(5, sets: 5, reps: 15, exercise: "Lunges")
            SavePlanPart(5, sets: 5, reps: 20, exercise: "Calf Raises")
        } else {
            SavePlanPart(1, sets: 5, reps: 5, exercise: "Bench Press")
            SavePlanPart(1, sets: 5, reps: 20, exercise: "Pushups")
            SavePlanPart(1, sets: 5, reps: 5, exercise: "Dips")
            SavePlanPart(1, sets: 5, reps: 12, exercise: "Tricep Push Downs")
            
            SavePlanPart(3, sets: 3, reps: 5, exercise: "Deadlifts")
            SavePlanPart(3, sets: 3, reps: 5, exercise: "Pullups")
            SavePlanPart(3, sets: 5, reps: 5, exercise: "Rows")
            SavePlanPart(3, sets: 5, reps: 8, exercise: "Dumbbell Curls")
            SavePlanPart(3, sets: 5, reps: 8, exercise: "Hammer Curls")
            
            SavePlanPart(5, sets: 5, reps: 5, exercise: "Squats")
            SavePlanPart(5, sets: 5, reps: 5, exercise: "Lunges")
            SavePlanPart(5, sets: 5, reps: 12, exercise: "Calf Raises")
        }
        
        var planOverview = self.storyboard?.instantiateViewControllerWithIdentifier("planOverview") as! PlanOverviewTableViewController
        
        let navigationController = UINavigationController(rootViewController: planOverview)
        self.presentViewController(navigationController, animated: true, completion: nil)

    }
    
    func SavePlanPart(day: Int, sets: Int, reps: Int, exercise: String) {
        var planPart: PlanPart = SwiftCoreDataHelper.insertManagedObject(NSStringFromClass(PlanPart), managedObjectConect: moc) as! PlanPart
        
        planPart.day = NSNumber(integer: day)
        planPart.exercise = exercise
        planPart.sets = NSNumber(integer: sets)
        planPart.reps = NSNumber(integer: reps)
        
        SwiftCoreDataHelper.saveManagedObjectContext(moc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height.text = Enums.HeightFeet.Four.description + " " + Enums.HeightInches.One.description
        weight.text = Enums.Weight.UnderOne.description
        age.text = Enums.Age.UnderSixteen.description
        timesPerWeek.text = Enums.TimesPerWeek.One.description
        goals.text = Enums.Goals.LoseFat.description
        
        agePickerView.dataSource = self
        agePickerView.delegate = self
        heightPickerView.dataSource = self
        heightPickerView.delegate = self
        weightPickerView.dataSource = self
        weightPickerView.delegate = self
        goalsPickerView.dataSource = self
        goalsPickerView.delegate = self
        tpwPickerView.dataSource = self
        tpwPickerView.delegate = self
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    
    
    
    
    
    
}