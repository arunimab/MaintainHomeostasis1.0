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
    
    @IBOutlet weak var airPump1: UITextField!
    @IBOutlet weak var airPump2: UITextField!
    
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
    
    @IBAction func airPump1(sender: UITextField) {
        let airPumpScale1 = Double(airPump1.text!)
        storeDouble("airPump1", value: airPumpScale1!)
    }
    
    @IBAction func airPump2(sender: UITextField) {
        let airPumpScale2 = Double(airPump2.text!)
        storeDouble("airPump2", value: airPumpScale2!)
    }
    
    override func viewDidLoad(){
        
    }
}
