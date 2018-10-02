//
//  ViewController.swift
//  Lab3
//
//  Created by Kendle Mcdowell on 10/1/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var timeiPhoneText: UITextField!
    @IBOutlet weak var wokeUpText: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updatePercentTotal(){
        var percent:Float
        var awakeHours:Float
        var phoneHours:Float
        if wokeUpText.text!.isEmpty{
            percent = 0.0
        }
        else{
            if timeiPhoneText.text!.isEmpty{
                //create a UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "You must enter a value for hours on iPhone... since you're obviously using it right now.", preferredStyle: UIAlertControllerStyle.alert)
                //create a UIAlertAction object for the button
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction) //adds the alert action to the alert object
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.timeiPhoneText.text="1"
                    self.updatePercentTotal()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                awakeHours = Float(wokeUpText.text!)!
                phoneHours = Float(timeiPhoneText.text!)!
                percent = (phoneHours/awakeHours)*100
                percentLabel.text = "% \(percent)"
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updatePercentTotal()
    }
    
    override func viewDidLoad() {
        wokeUpText
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

