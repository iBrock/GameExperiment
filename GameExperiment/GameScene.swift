//
//  GameScene.swift
//  GameExperiment
//
//  Created by Kean Brock on 6/21/15.
//  Copyright (c) 2015 Kean Brock. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let ninja = SKSpriteNode(imageNamed:"sprite-ninja-ninja")

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -3.0)
        
        ninja.xScale = 0.5
        ninja.yScale = 0.5
        ninja.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(ninja)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            
            let cursor = touch.locationInNode(self)
            
            let moveToCursor = SKAction.moveTo(cursor, duration: 0.8)
            
            ninja.runAction(moveToCursor)

            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"troll-face")
            
            sprite.xScale = 0.1
            sprite.yScale = 0.1
            sprite.position = location
            
            let actionSpin = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            let actionMove = SKAction.moveByX(200, y: 100, duration: 2)
            
            sprite.runAction(SKAction.repeatActionForever(actionSpin))
            sprite.runAction(actionMove)
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
