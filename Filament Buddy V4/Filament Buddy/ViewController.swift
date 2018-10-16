//
//  ViewController.swift
//  Filament Buddy
//
//  Created by Kendle Mcdowell on 10/3/18.
//  Copyright © 2018 Kendle Mcdowell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //keep track of pressed button
    var buttonTag: Int = 0
    
    //data
    let filfile = "filfile.plist"
    var fil1 = FilamentRoll()
    var fil2 = FilamentRoll()
    var fil3 = FilamentRoll()
    var fil4 = FilamentRoll()
    var fil5 = FilamentRoll()
    var fil6 = FilamentRoll()
    
    //filament information textboxes and labels
    @IBOutlet weak var filName: UITextField!
    @IBOutlet weak var filDiam: UITextField!
    @IBOutlet weak var filMass: UITextField!
    @IBOutlet weak var filDens: UITextField!
    @IBOutlet weak var filVol: UILabel!
    @IBOutlet weak var filLen: UILabel!
    @IBOutlet weak var segControl: UISegmentedControl!
    //color control
    @IBOutlet weak var filColor: UIPickerView!
    private let dataSource = ["Choose a color", "Red","Blue","Green","Yellow","Orange","White","Black","Purple","Pink"]
    var colors = ["none","none","none","none","none","none"]
    
    //model spec outlets
    @IBOutlet weak var modVolText: UILabel!
    @IBOutlet weak var modVolTextBox: UITextField!
    @IBOutlet weak var modFillText: UILabel!
    @IBOutlet weak var modFillSlider: UISlider!
    @IBOutlet weak var modFillPercent: UILabel!
    
    //data altering buttons
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var calcButton: UIButton!
    
    //six filament buttons
    @IBOutlet weak var filament1: UIButton!
    @IBOutlet weak var filament2: UIButton!
    @IBOutlet weak var filament3: UIButton!
    @IBOutlet weak var filament4: UIButton!
    @IBOutlet weak var filament5: UIButton!
    @IBOutlet weak var filament6: UIButton!
    
    //update buttons
    func updateButtonBackground(){
        let thisButton = [filament1,filament2,filament3,filament4,filament5,filament6]
        for i in 0 ..< thisButton.count {
            if buttonTag == i{
                thisButton[i]?.backgroundColor = UIColor.darkGray
            }
            else{
                //make the background nothing
                thisButton[i]?.backgroundColor = UIColor.clear
            }
        }
    }
    
    //update filament data
    @IBAction func updateButton(_ sender: UIButton) {
        var fils = [fil1,fil2,fil3,fil4,fil5,fil6]
        fils[buttonTag].Name = filName.text
        fils[buttonTag].Diameter = filDiam.text
        fils[buttonTag].Density = filDens.text
        fils[buttonTag].Mass = filMass.text
        fils[buttonTag].Volume = filVol.text
        fils[buttonTag].Length = filLen.text
        fils[buttonTag].Color = colors[buttonTag]
        fils[buttonTag].Tag = buttonTag
    }
    
    //update textbox data in print tab
    @IBAction func calcButton(_ sender: UIButton) {
        calcPrint()
    }
    
    //change the percent label with the slider
    @IBAction func changeModPercent(_ sender: UISlider) {
        let modPercent = sender.value //this is a float
        modFillPercent.text=String(format: "%.0f", modPercent)
    }
    
    //switch between print and my filament tabs
    @IBAction func segViewUpdate(_ sender: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0{
            //hide calc button
            calcButton.isHidden = true
            //show colors
            filColor.isHidden = false
            //hide model specs
            modVolText.isHidden = true
            modVolTextBox.isHidden = true
            modFillText.isHidden = true
            modFillSlider.isHidden = true
            modFillPercent.isHidden = true
        }
        else if segControl.selectedSegmentIndex == 1{
            //show calc button
            calcButton.isHidden = false;
            //hide colors
            filColor.isHidden = true
            //hide model specs
            modVolText.isHidden = false
            modVolTextBox.isHidden = false
            modFillText.isHidden = false
            modFillSlider.isHidden = false
            modFillPercent.isHidden = false
        }
    }
    
    //six button actions
    @IBAction func button1(_ sender: UIButton) {
        buttonTag = sender.tag
        updateButtonBackground()
        updateBoxes(_tag: buttonTag)
    }
    @IBAction func button2(_ sender: UIButton) {
        buttonTag = sender.tag
        updateButtonBackground()
        updateBoxes(_tag: buttonTag)
    }
    @IBAction func button3(_ sender: UIButton) {
        buttonTag = sender.tag
        updateButtonBackground()
        updateBoxes(_tag: buttonTag)
    }
    @IBAction func button4(_ sender: UIButton) {
        buttonTag = sender.tag
        updateButtonBackground()
        updateBoxes(_tag: buttonTag)
    }
    @IBAction func button5(_ sender: UIButton) {
        buttonTag = sender.tag
        updateButtonBackground()
        updateBoxes(_tag: buttonTag)
    }
    @IBAction func button6(_ sender: UIButton) {
        buttonTag = sender.tag
        updateButtonBackground()
        updateBoxes(_tag: buttonTag)
    }
    ////////////////////
    
    //updates boxes based on external file
    func updateBoxes(_tag: Int){
        var fils = [fil1,fil2,fil3,fil4,fil5,fil6]
        filName.text = fils[buttonTag].Name
        filDiam.text = fils[buttonTag].Diameter
        filDens.text = fils[buttonTag].Density
        filMass.text = fils[buttonTag].Mass
        filVol.text = fils[buttonTag].Volume
        filLen.text = fils[buttonTag].Length
    }
    
    //change textbox vals based on model specs
    func calcPrint(){
        //change values in box to calc values from print
        let diam = Float(filDiam.text!)!      //convert to cm
        let modVol = Float(modVolTextBox.text!)!
        let fillPerc = Float(modFillPercent.text!)! / 100
        var printMass: Float
        var printLen: Float
        var newMass: Float
        var newLen: Float
        var newVol: Float
        let vol1cm = 3.14 * ((diam / 2) * (diam / 2)) * 1
        let printVol = modVol * fillPerc
        printMass = printVol * Float(filDens.text!)!
        printLen = printVol / vol1cm //returns the length in cm of filament used
        
        //update textbox values
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle=NumberFormatter.Style.decimal //set the number style
        
        //update volume
        newVol = Float(filVol.text!)! - printVol
        filVol.text = decimalFormatter.string(from: NSNumber(value: newVol)) //returns a formatted string
        
        //update length
        newLen = Float(filLen.text!)! - printLen
        filLen.text = decimalFormatter.string(from: NSNumber(value: newLen)) //returns a formatted string
        
        //update mass
        newMass = Float(filMass.text!)! - printMass
        filMass.text = decimalFormatter.string(from: NSNumber(value: newMass)) //returns a formatted string
    }
    
    //Change the saved Filament Vals based on Model Specs
    func updatePrint(){
        //change values in filament file to calc values from print
    }
    
    //make keyboard go away
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //update vol and len whenever a textbox is edited
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateVol()
        updateLen()
    }
    
    //update volume label
    func updateVol(){
        var vol: Float
        if filMass.text!.isEmpty || filDens.text!.isEmpty{
            filVol.text = nil
        }
        else{
            vol = Float(filMass.text!)! / Float(filDens.text!)!
            
            //format result as decimal
            let decimalFormatter = NumberFormatter()
            decimalFormatter.numberStyle=NumberFormatter.Style.decimal //set the number style
            filVol.text=decimalFormatter.string(from: NSNumber(value: vol)) //returns a formatted string
        }
    }
    
    //update length label
    func updateLen(){
        var len: Float
        if filMass.text!.isEmpty || filDens.text!.isEmpty || filDiam.text!.isEmpty{
            filLen.text = nil
        }
        else{
            let mass = Float(filMass.text!)!
            let dens = Float(filDens.text!)!
            let diam = Float(filDiam.text!)!
            let radi = diam / 2
            let vol1cm = 3.14 * (radi * radi) * 1
            len = mass / (dens * vol1cm)
            
            //format result as decimal
            let decimalFormatter = NumberFormatter()
            decimalFormatter.numberStyle=NumberFormatter.Style.decimal //set the number style
            filLen.text=decimalFormatter.string(from: NSNumber(value: len)) //returns a formatted string
        }
    }
    
    override func viewDidLoad() {
        //set delegates
        filName.delegate = self
        filDiam.delegate = self
        filMass.delegate = self
        filDens.delegate = self
        filColor.dataSource = self
        filColor.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//return url to filament file
func dataFileURL(_filename:String) -> URL? {
    //returns array of URLS
    let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
    var url : URL?
    //append file name to first item in array
    url = urls.first?.appendingPathComponent(_filename)
    //return URL of the data file or nil
    return url
}

// picker view set up
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //change color of filament here
        let thisButton = [filament1,filament2,filament3,filament4,filament5,filament6]
        thisButton[buttonTag]?.setImage(UIImage(named: dataSource[row]), for: .normal)
        colors[buttonTag] = dataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
/////////////////////////
