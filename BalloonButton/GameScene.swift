//
//  GameScene.swift
//  BalloonButton
//
//  Created by BHATTACHARYA, ARUNIMA on 2/1/16.
//  Copyright (c) 2016 BHATTACHARYA, ARUNIMA. All rights reserved.
//

import SpriteKit

//let myButton1 = SKSpriteNode(imageNamed: "RedSqaure-1")

class GameScene: SKScene {
    let myButton1 = SKSpriteNode(imageNamed: "RedSqaure-1")
    let myButton2 = SKSpriteNode(imageNamed: "RedSqaure-1")
    let myBalloon = SKSpriteNode(imageNamed: "Circle")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed: "Cochin-Bold")
        myLabel.text = "Maintain Homeostasis"
        myLabel.fontSize = 50
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMinY(self.frame))
        myBalloon.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        myButton1.position = CGPoint(x: CGRectGetMidX(self.frame), y: 150)
        myButton1.xScale = 1.25
        myButton1.yScale = 1.25
        myButton2.position = CGPoint(x: CGRectGetMidX(self.frame), y: 600)
        myButton2.xScale = 1.25
        myButton2.yScale = 1.25
        
        self.addChild(myButton1)
        self.addChild(myButton2)
        self.addChild(myBalloon)
        self.addChild(myLabel)
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first!
        if myButton1.containsPoint(touch.locationInNode(self)) {
            let myBalloonHScale = myBalloon.xScale
            let myBalloonVScale = myBalloon.yScale
            myBalloon.xScale = myBalloonHScale * 1.025
            myBalloon.yScale = myBalloonVScale * 1.025
        }
        if myButton2.containsPoint(touch.locationInNode(self)) {
            let myBalloonHScale = myBalloon.xScale
            let myBalloonVScale = myBalloon.yScale
            myBalloon.xScale = myBalloonHScale * 0.975
            myBalloon.yScale = myBalloonVScale * 0.975
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
