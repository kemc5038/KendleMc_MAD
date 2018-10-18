//
//  ViewController.swift
//  Midterm 1
//
//  Created by Kendle Mcdowell on 10/18/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var workoutTime: UITextField!
    @IBOutlet weak var weeklySwitch: UISwitch!
    @IBOutlet weak var workoutsPerWeek: UISlider!
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var miles: UILabel!
    @IBOutlet weak var caloriesBurned: UILabel!
    @IBOutlet weak var workoutsPerWeekLabel: UILabel!
    @IBOutlet weak var workoutButton: UIButton!
    
    var workoutTimeBox: Float = 0
    var weeklyWorkouts: Float = 5.0
    var type: Float = 6
    var calType: Float = 600
    
    //keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        workoutTimeBox = Float(workoutTime.text!)!
    }
    

    @IBAction func workoutType(_ sender: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0 {
            workoutImage.image = UIImage(named: "run.png")
            type = 6
            calType = 600
        }
        else if segControl.selectedSegmentIndex == 1 {
            workoutImage.image = UIImage(named: "swim.png")
            type = 2
            calType = 510
        }
        else if segControl.selectedSegmentIndex == 2 {
            workoutImage.image = UIImage(named: "bike.png")
            type = 15
            calType = 420
        }
    }
    
    @IBAction func workoutButton(_ sender: UIButton) {
        //calculate
        workoutTimeBox = Float(workoutTime.text!)!
        let time = workoutTimeBox / 60
        var milesRun: Float
        var calories: Float
        
        //alert for low workout time
        if workoutTimeBox < 30 {
            let alert=UIAlertController(title: "Yikes", message: "You should really work out more.", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
        //normal calculation
        milesRun = time * type
        calories = time * calType
        miles.text = String(format: "%f", milesRun)
        caloriesBurned.text = String(format: "%f", calories)
        
        if weeklySwitch.isOn {
            //multiply by slider
            milesRun = milesRun * weeklyWorkouts
            calories = calories * weeklyWorkouts
            miles.text = String(format: "%f", milesRun)
            caloriesBurned.text = String(format: "%f", calories)
        }
    }
    
    @IBAction func sliderVal(_ sender: UISlider) {
        //update variable everytime slider is moved
        weeklyWorkouts = sender.value //float
        workoutsPerWeekLabel.text = String(format: "%f", weeklyWorkouts)
    }
    
    override func viewDidLoad() {
        workoutTime.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

