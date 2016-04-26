//
//  Settings.swift
//  BalloonButton
//
//  Created by BHATTACHARYA, ARUNIMA on 2/16/16.
//  Copyright © 2016 BHATTACHARYA, ARUNIMA. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Settings: UIViewController{
    

    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var label2: UILabel!
    
    //timer start here
    
    @IBOutlet weak var timerIndicatorLabel: UILabel!
    
    @IBAction func timer30sButton(sender: UIButton) {
        
        storeDouble("timer", value: Double(30))
        timerIndicatorLabel.text = String("30 seconds")
    }
    
    @IBAction func timer60sButton(sender: UIButton) {
        
        storeDouble("timer", value: Double(60))
        timerIndicatorLabel.text = String("60 seconds")
    }
    
    @IBAction func timer90sButton(sender: UIButton) {
        
        storeDouble("timer", value: Double(90))
        timerIndicatorLabel.text = String("90 seconds")
        
    }
    //timer end here
    
    @IBAction func sliderValueChanged1(sender: UISlider) {
        //Read in value from slider
        let currentValue = sender.value
        //Round value
        let roundedValue = round(1000 * currentValue) / 1000
        //Store for GameScene
        storeDouble("airPump1", value: Double(roundedValue))
        //Display in label
        label1.text = "\(roundedValue)"
    }
    
    @IBAction func sliderValueChanged2(sender: UISlider) {
        //Read in value from slider
        let currentValue = sender.value
        //Round value
        let roundedValue = round(1000 * currentValue) / 1000
        //Store for GameScene
        storeDouble("airPump2", value: Double(roundedValue))
        //Display in label
        label2.text = "\(roundedValue)"
    }
    
    
    
    override func viewDidLoad(){
        
    }
}
