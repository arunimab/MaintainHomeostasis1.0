//
//  GameScene.swift
//  BalloonButton
//
//  Created by BHATTACHARYA, ARUNIMA on 2/1/16.
//  Copyright (c) 2016 BHATTACHARYA, ARUNIMA. All rights reserved.
//

import SpriteKit
import UIKit

//let myButton1 = SKSpriteNode(imageNamed: "RedSqaure-1")

class GameScene: SKScene {
    let myButton1 = SKSpriteNode(imageNamed: "RedSqaure-1")
    let myButton2 = SKSpriteNode(imageNamed: "RedSqaure-1")
    let myBalloon = SKSpriteNode(imageNamed: "Circle")
    let myTimer = SKLabelNode(fontNamed: "Cochin-Bold")
    let myStartNode = SKSpriteNode (imageNamed: "TimeStart")
    let mySettings = SKSpriteNode (imageNamed: "Settings")
    let mySetPoint = SKSpriteNode (imageNamed: "YellowRing")
    let airOutput = SKAction.scaleTo(CGFloat(0.25), duration: NSTimeInterval(30))
    
    //Timer Variables
    var defaultseconds = Int(retrieveDouble("timer")!)
    var timerCount = Int(retrieveDouble("timer")!)
    
    var minutes = 0
    var seconds = 0
    
    var timerRunning = false //tell xCode if our timer is running
    var timer = NSTimer()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //Timer Label
        myTimer.text = "00:00"
        myTimer.fontSize = 25
        myTimer.position = CGPoint(x:CGRectGetMidX(self.frame) - 300, y:CGRectGetMaxY(self.frame) - 50)
        
        //Start node set up
        myStartNode.xScale = 0.20
        myStartNode.yScale = 0.20
        myStartNode.position = CGPoint(x:CGRectGetMidX(self.frame) - 410, y:CGRectGetMaxY(self.frame) - 40)
        
        //Base Label
        let myLabel = SKLabelNode(fontNamed: "Cochin-Bold")
        myLabel.text = "Maintain Homeostasis"
        myLabel.fontSize = 50
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame))
        
        //Settings Node
        /*mySettings.xScale = 0.50
        mySettings.yScale = 0.50
        mySettings.position = CGPoint(x:CGRectGetMaxX(self.frame) - 100, y:CGRectGetMaxY(self.frame) - 40)*/
        
        //Set Up Balloon in center
        myBalloon.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        myBalloon.xScale = 1.25
        myBalloon.yScale = 1.25
        //Set Up Set Point
        mySetPoint.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        mySetPoint.xScale = 1.5
        mySetPoint.yScale = 1.5
        
        
        //Set Up Button1
        myButton1.position = CGPoint(x: CGRectGetMidX(self.frame) - 400, y: 150)
        myButton1.xScale = 1.25
        myButton1.yScale = 1.25
        
        //Set Up Button2
        myButton2.position = CGPoint(x: CGRectGetMidX(self.frame) + 400, y: 650)
        myButton2.xScale = 1.25
        myButton2.yScale = 1.25
        
        self.addChild(mySetPoint)
        self.addChild(myButton1)
        self.addChild(myButton2)
        self.addChild(myBalloon)
        self.addChild(myLabel)
        self.addChild(myTimer)
        self.addChild(myStartNode)
        //self.addChild(mySettings)
        
        //constantOutput()
    }
    
    /*override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
            
        }
    }*/
    
    func timerCountDown() {
        
        minutes = timerCount / 60
        seconds = timerCount - (minutes * 60)
        
        timerCount--
        myTimer.text = String(format: "%02d:%02d", minutes, seconds)
        
        if myTimer.text == "00:00" {
            timer.invalidate()
            timerRunning = false
            timerCount = defaultseconds
        }
    }
    
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timerCountDown"), userInfo: nil, repeats: true)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        if myButton1.containsPoint(touch.locationInNode(self)) {
            let myBalloonHScale = myBalloon.xScale
            let myBalloonVScale = myBalloon.yScale
            if (!timerRunning) {
                myBalloon.xScale = myBalloonHScale
                myBalloon.yScale = myBalloonVScale
            }
            else {
                myBalloon.xScale = myBalloonHScale * 1.025
                myBalloon.yScale = myBalloonVScale * 1.025
            }
        }
        if myButton2.containsPoint(touch.locationInNode(self)) {
            let myBalloonHScale = myBalloon.xScale
            let myBalloonVScale = myBalloon.yScale
            if (!timerRunning) {
                myBalloon.xScale = myBalloonHScale
                myBalloon.yScale = myBalloonVScale
            }
            else {
                myBalloon.xScale = myBalloonHScale * 0.975
                myBalloon.yScale = myBalloonVScale * 0.975
            }
        }
        if myStartNode.containsPoint(touch.locationInNode(self)) {
            if timerRunning == false {
                startTimer()
                timerRunning = true
            }
        }
        //if mySettings.containsPoint(touch.locationInNode(self)) {
            
        //}
    }
    
    //NEED TO FIGURE THIS OUT!! 3/8/2016
    /*
    func constantOutput () {
        let myBalloonHScale = myBalloon.xScale
        let myBalloonVScale = myBalloon.yScale
        myBalloon.xScale = myBalloonHScale * 0.975
        myBalloon.yScale = myBalloonVScale * 0.975
        if (myBalloon.xScale > 0.5) {
            constantOutput()
        }
        else {
            myBalloon.xScale = 0.55
            myBalloon.yScale = 0.55
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }*/
}
