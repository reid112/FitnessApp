//
//  SetupViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-04.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation

class SetupViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var heightPickerView:UIPickerView! = UIPickerView()
    var weightPickerView:UIPickerView! = UIPickerView()
    var tpwPickerView:UIPickerView = UIPickerView()
    var goalsPickerView:UIPickerView = UIPickerView()
    
    var selectedFeet = "4 feet"
    var selectedInches = "1 inch"
    var heightFeetOptions = ["4 feet","5 feet","6 feet","7 feet","8 feet"]
    var heightInchesOptions = ["1 inch","2 inches","3 inches","4 inches","5 inches","6 inches","7 inches","8 inches","9 inches","10 inches","11 inches"]

    var weightOptions = ["< 100","100 - 130","130 - 150","150 - 180","180 - 200","> 200"]

    var tpwOptions = ["1","2","3","4","5","6","7"]
    
    var goalsOptions = ["Lose weight","Gain Muscle"]
    
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
        var datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: Selector("ageValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
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
    
    
    
    
    func ageValueChanged(sender: UIDatePicker) {
        
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        age.text = dateFormatter.stringFromDate(sender.date)
        
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
                return heightFeetOptions.count
            } else {
                return heightInchesOptions.count
            }
        } else if (pickerView == weightPickerView) {
            return weightOptions.count
        } else if (pickerView == tpwPickerView) {
            return tpwOptions.count
        } else {
            return goalsOptions.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView == heightPickerView) {
            if (component == 0) {
                return heightFeetOptions[row]
            } else {
                return heightInchesOptions[row]
            }
        } else if (pickerView == weightPickerView) {
            return weightOptions[row]
        } else if (pickerView == tpwPickerView) {
            return tpwOptions[row]
        } else {
            return goalsOptions[row]
        }
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == heightPickerView) {
            if (component == 0) {
                selectedFeet = heightFeetOptions[row]
            }else {
                selectedInches = heightInchesOptions[row]
            }
            
            height.text = selectedFeet + " " + selectedInches
        } else if (pickerView == weightPickerView) {
            weight.text = weightOptions[row]
        } else if (pickerView == tpwPickerView) {
            timesPerWeek.text = tpwOptions[row]
        } else {
            goals.text = goalsOptions[row]
        }
        
    }
    
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    
    
    
    
    
    
}