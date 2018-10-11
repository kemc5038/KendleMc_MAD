//
//  Scene2ViewController.swift
//  Lab4
//
//  Created by Kendle Mcdowell on 10/2/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userBook: UITextField!
    @IBOutlet weak var userAuthor: UITextField!
    @IBOutlet weak var userRating: UITextField!
    
    override func viewDidLoad() {
        userBook.delegate=self
        userAuthor.delegate=self
        userRating.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneButton"{
            let scene1ViewController = segue.destination as! ViewController
            //check that text was entered
            if userBook.text!.isEmpty == false{
                scene1ViewController.user.favBook = userBook.text
            }
            if userAuthor.text!.isEmpty == false{
                scene1ViewController.user.favAuthor = userAuthor.text
            }
            if userRating.text!.isEmpty == false{
                scene1ViewController.user.rating = userRating.text
            }
        }
    }

}
