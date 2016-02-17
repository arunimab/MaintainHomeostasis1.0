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
    
    override func viewDidLoad(){
        
    }
}
