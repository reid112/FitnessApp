//
//  SetupViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-04.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation

class SetupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var agePickerView:UIPickerView! = UIPickerView()
    var heightPickerView:UIPickerView! = UIPickerView()
    var weightPickerView:UIPickerView! = UIPickerView()
    var tpwPickerView:UIPickerView = UIPickerView()
    var goalsPickerView:UIPickerView = UIPickerView()
    
    var selectedAge:Int16 = 0
    var selectedFeet:Int16 = 0
    var selectedInches:Int16 = 0
    var selectedWeight:Int16 = 0
    var selectedTpw:Int16 = 0
    var selectedGoals:Int16 = 0
    
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
        
    }
    
    @IBAction func AgeEditing(sender: UITextField) {
        agePickerView.dataSource = self
        agePickerView.delegate = self
        
        sender.inputView = agePickerView
    }
    
    @IBAction func HeightEditing(sender: UITextField) {
        heightPickerView.dataSource = self
        heightPickerView.delegate = self
        
        sender.inputView = heightPickerView
    }
    
    @IBAction func WeightEditing(sender: UITextField) {
        weightPickerView.dataSource = self
        weightPickerView.delegate = self
        
        sender.inputView = weightPickerView
    }
    
    @IBAction func GoalsEditing(sender: UITextField) {
        goalsPickerView.dataSource = self
        goalsPickerView.delegate = self
        
        sender.inputView = goalsPickerView
    }
    
    @IBAction func TimesPerWeekEditing(sender: UITextField) {
        tpwPickerView.dataSource = self
        tpwPickerView.delegate = self
        
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
            }else {
                selectedInchesString = Enums.HeightInches(rawValue: row)!.description
            }
            
            height.text = selectedFeetString + " " + selectedInchesString
        } else if (pickerView == weightPickerView) {
            weight.text = Enums.Weight(rawValue: row)?.description
        } else if (pickerView == tpwPickerView) {
            timesPerWeek.text = Enums.TimesPerWeek(rawValue: row)?.description
        } else if (pickerView == goalsPickerView) {
            goals.text = Enums.Goals(rawValue: row)?.description
        } else {
            age.text = Enums.Age(rawValue: row)?.description
        }
        
    }
    
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        height.text = Enums.HeightFeet.Four.description + " " + Enums.HeightInches.One.description
        weight.text = Enums.Weight.UnderOne.description
        age.text = Enums.Age.UnderSixteen.description
        timesPerWeek.text = Enums.TimesPerWeek.One.description
        goals.text = Enums.Goals.LoseFat.description
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    
    
    
    
    
    
}