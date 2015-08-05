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
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var goals: UITextField!
    @IBOutlet weak var timesPerWeek: UITextField!
    @IBOutlet weak var giveMeAPlanButton: UIButton!
    
    
    
    @IBAction func GiveMeAPlanClicked(sender: UIButton) {
        let userDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: moContext!)
        
        let user = User(entity: userDescription!, insertIntoManagedObjectContext: moContext)
        
        user.gender = gender.selectedSegmentIndex
        user.age = selectedAge
        user.heightFeet = selectedFeet
        user.heightInches = selectedInches
        user.weight = selectedWeight
        user.goals = selectedGoals
        user.times_per_week = selectedTpw
        
        var error: NSError?
        
        moContext?.save(&error)
        
        if let err = error {
            let a = UIAlertView(title: "Error", message: err.localizedFailureReason, delegate: nil, cancelButtonTitle: "Close")
            a.show()
        } else {
            
            CreatePlanForUser()
        }
        
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
        let planDescription = NSEntityDescription.entityForName("Plan", inManagedObjectContext: moContext!)
        
        let plan = Plan(entity: planDescription!, insertIntoManagedObjectContext: moContext)
        
        var error: NSError?
        
        if (selectedGoals == Enums.Goals.LoseFat.rawValue) {
            plan.day = 1
            plan.exercise = "Test 1"
            plan.sets = 3
            plan.reps = 15
            moContext?.save(&error)
            
            plan.day = 1
            plan.exercise = "Test 2"
            plan.sets = 3
            plan.reps = 15
            moContext?.save(&error)
            
            plan.day = 3
            plan.exercise = "Test 1"
            plan.sets = 3
            plan.reps = 15
            moContext?.save(&error)
            
            plan.day = 3
            plan.exercise = "Test 2"
            plan.sets = 3
            plan.reps = 15
            moContext?.save(&error)
            
            plan.day = 5
            plan.exercise = "Test 1"
            plan.sets = 3
            plan.reps = 15
            moContext?.save(&error)
            
            plan.day = 5
            plan.exercise = "Test 2"
            plan.sets = 3
            plan.reps = 15
            moContext?.save(&error)
        } else {
            plan.day = 1
            plan.exercise = "Test 1"
            plan.sets = 5
            plan.reps = 5
            moContext?.save(&error)
            
            plan.day = 1
            plan.exercise = "Test 2"
            plan.sets = 5
            plan.reps = 5
            moContext?.save(&error)
            
            plan.day = 3
            plan.exercise = "Test 1"
            plan.sets = 5
            plan.reps = 5
            moContext?.save(&error)
            
            plan.day = 3
            plan.exercise = "Test 2"
            plan.sets = 5
            plan.reps = 5
            moContext?.save(&error)
            
            plan.day = 5
            plan.exercise = "Test 1"
            plan.sets = 5
            plan.reps = 5
            moContext?.save(&error)
            
            plan.day = 5
            plan.exercise = "Test 2"
            plan.sets = 5
            plan.reps = 5
            moContext?.save(&error)
        }
        
        

        var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
        self.presentViewController(main, animated: false, completion: nil)

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