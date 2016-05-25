//
//  SecondGameScene.swift
//  CocktailIngradientAnimation
//
//  Created by 大畅 on 16/5/12.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import SpriteKit

class SecondGameScene: SKScene {
    var backgroundSprite : SKSpriteNode!
    
    var baseWineSprite : SKSpriteNode!
    var liquerSprite : SKSpriteNode!
    var juiceSprite : SKSpriteNode!
    var sodaSprite : SKSpriteNode!
    var spiceSprite : SKSpriteNode!
    
    var wineName : String = ""
    var flavourName : String = ""
    
    var spinDuration : Double = 5.0
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Menlo")
        myLabel.text = "SINGAPORE SLING"
        myLabel.fontSize = 42
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - 90)
        self.addChild(myLabel)
        
        let flavorLabel = SKLabelNode(fontNamed:"Menlo")
        flavorLabel.text = "SOUR"
        flavorLabel.fontSize = 24
        flavorLabel.alpha = 0.5
        flavorLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - 135)
        self.addChild(flavorLabel)
        
        baseWineSprite = SKSpriteNode(imageNamed:"Sour_BaseWine")
        baseWineSprite.xScale = 2
        baseWineSprite.yScale = 2
        baseWineSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        baseWineSprite.zPosition = 0
        let baseWineAction = SKAction.rotateByAngle(CGFloat(-M_PI), duration:spinDuration)
        baseWineSprite.runAction(SKAction.repeatActionForever(baseWineAction))
        self.addChild(baseWineSprite)
        
        liquerSprite = SKSpriteNode(imageNamed:"Sour_LiquorWine")
        liquerSprite.xScale = 2
        liquerSprite.yScale = 2
        liquerSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        liquerSprite.zPosition = 1
        let liquerAction = SKAction.rotateByAngle(CGFloat(M_PI), duration:spinDuration)
        liquerSprite.runAction(SKAction.repeatActionForever(liquerAction))
        self.addChild(liquerSprite)
        
        juiceSprite = SKSpriteNode(imageNamed:"Sour_Juice")
        juiceSprite.xScale = 2
        juiceSprite.yScale = 2
        juiceSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        juiceSprite.alpha = 0.35
        juiceSprite.zPosition = 2
        let juiceAction = SKAction.rotateByAngle(CGFloat(-M_PI), duration:spinDuration)
        juiceSprite.runAction(SKAction.repeatActionForever(juiceAction))
        self.addChild(juiceSprite)
        
        spiceSprite = SKSpriteNode(imageNamed:"Sour_Spice")
        spiceSprite.xScale = 1
        spiceSprite.yScale = 1
        spiceSprite.position = CGPointMake(CGRectGetMidX(self.frame) - 10, CGRectGetMidY(self.frame) + 10 + 45)
        spiceSprite.zPosition = 3
        spiceSprite.alpha = 0.15
        
        //        spiceSprite.runAction(SKAction.repeatActionForever(actionGroup))
        self.addChild(spiceSprite)
        
        //radar map bg
        backgroundSprite = SKSpriteNode(imageNamed: "animabg")
        backgroundSprite.xScale = 1.35
        backgroundSprite.yScale = 1.35
        backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        backgroundSprite.zPosition = -1
        self.addChild(backgroundSprite)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
