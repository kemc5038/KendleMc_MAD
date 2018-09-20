//
//  ViewController.swift
//  Lab 2
//
//  Created by Kendle Mcdowell on 9/19/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogButton: UISegmentedControl!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var goodDog: UILabel!
    
    @IBAction func changeCase(_ sender: UISlider) {
        let slide = sender.value
        if slide < 1 {
            goodDog.text = goodDog.text?.lowercased()
        }
        else if slide > 1 {
            goodDog.text = goodDog.text?.uppercased()
        }
    }
    @IBAction func changeGender(_ sender: UISwitch) {
        if genderSwitch.isOn {
            goodDog.text = "Good Boy"
        }
        else{
            goodDog.text = "Good Girl"
        }
    }
    @IBAction func changeDog(_ sender: UISegmentedControl) {
        if dogButton.selectedSegmentIndex == 0 {
            dogImage.image=UIImage(named: "babyBoy")
        }
        else if dogButton.selectedSegmentIndex == 1 {
            dogImage.image=UIImage(named: "oldBoy")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

