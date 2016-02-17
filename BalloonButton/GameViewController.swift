//
//  GameViewController.swift
//  BalloonButton
//
//  Created by BHATTACHARYA, ARUNIMA on 2/1/16.
//  Copyright (c) 2016 BHATTACHARYA, ARUNIMA. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    //Timer START
    
    var defaultseconds = Int(retrieveDouble("timer")!)
    var timerCount = Int(retrieveDouble("timer")!)
    
    var minutes = 0
    var seconds = 0
    
    
    var timerRunning = false //tell xCode if our timer is running
    var timer = NSTimer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func timerCountDown() {
        
        minutes = timerCount / 60
        seconds = timerCount - (minutes * 60)
        
        timerCount--
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        
        if timerLabel.text == "00:00" {
            timer.invalidate()
            timerRunning = false
            timerCount = defaultseconds
        }
    }
    
    
    
    
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerCountDown"), userInfo: nil, repeats: true)
    }
    
    @IBAction func startButton(sender: AnyObject) {
        if timerRunning == false{
            startTimer()
            timerRunning = true
        }
    }
    //Timer END


    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
