//
//  ViewController.swift
//  Lab 1
//
//  Created by Kendle Mcdowell on 9/11/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var indMood: UIImageView!
    @IBOutlet weak var moodText: UILabel!
    @IBAction func Button(_ sender: UIButton) {
        if sender.tag == 1{
            indMood.image = UIImage(named: "Happy")
            moodText.text = "Great!"
        }
        else if sender.tag == 2{
            indMood.image = UIImage(named: "Meh")
            moodText.text = "Could Be Worse."
        }
        else if sender.tag == 3{
            indMood.image = UIImage(named: "SAD")
            moodText.text = "Bummer!"
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

