//
//  GameScene.swift
//  CocktailIngradientAnimation
//
//  Created by 大畅 on 16/5/12.
//  Copyright (c) 2016年 Dachang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    //Public Interfaces
    var baseWineSpriteImage : UIImage!
    var liquerSpriteImage : UIImage!
    var juiceSpriteImage : UIImage!
    var spiceSpriteImage : UIImage!
    var cocktailNameString : String! = "CHERRY BLOSSOM"
    var cocktailFlavourString : String! = "SWEET"
    var cocktailAlcoholDegree : Int = 28
    var cocktailAmount : Int = 66
    //Sprites
    var backgroundSprite : SKSpriteNode!
    var baseWineSprite : SKSpriteNode!
    var liquerSprite : SKSpriteNode!
    var juiceSprite : SKSpriteNode!
    var sodaSprite : SKSpriteNode!
    var spiceSprite : SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        let spinDuration : Double = 3.125 * 28 / Double(cocktailAlcoholDegree)
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Menlo")
        myLabel.text = cocktailNameString
        myLabel.fontSize = 42
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - 90)
        self.addChild(myLabel)
        
        let flavorLabel = SKLabelNode(fontNamed:"Menlo")
        flavorLabel.text = cocktailFlavourString
        flavorLabel.fontSize = 24
        flavorLabel.alpha = 0.5
        flavorLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame) - 135)
        self.addChild(flavorLabel)
        
        baseWineSprite = SKSpriteNode(imageNamed:"SweetBasewine")
        baseWineSprite.xScale = 4 * (CGFloat(cocktailAmount) / 280)
        baseWineSprite.yScale = 4 * (CGFloat(cocktailAmount) / 280)
        baseWineSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        baseWineSprite.zPosition = 0
        let baseWineAction = SKAction.rotateByAngle(CGFloat(-M_PI), duration:spinDuration)
        baseWineSprite.runAction(SKAction.repeatActionForever(baseWineAction))
        self.addChild(baseWineSprite)
        
        liquerSprite = SKSpriteNode(imageNamed:"SweetLiquerwine")
        liquerSprite.xScale = 4 * (CGFloat(cocktailAmount) / 280)
        liquerSprite.yScale = 4 * (CGFloat(cocktailAmount) / 280)
        liquerSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        liquerSprite.zPosition = 1
        let liquerAction = SKAction.rotateByAngle(CGFloat(M_PI), duration:spinDuration)
        liquerSprite.runAction(SKAction.repeatActionForever(liquerAction))
        self.addChild(liquerSprite)
        
        juiceSprite = SKSpriteNode(imageNamed:"SweetJuice")
        juiceSprite.xScale = 4 * (CGFloat(cocktailAmount) / 280)
        juiceSprite.yScale = 4 * (CGFloat(cocktailAmount) / 280)
        juiceSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        juiceSprite.alpha = 0.35
        juiceSprite.zPosition = 2
        let juiceAction = SKAction.rotateByAngle(CGFloat(-M_PI), duration:spinDuration)
        juiceSprite.runAction(SKAction.repeatActionForever(juiceAction))
        self.addChild(juiceSprite)
        
        spiceSprite = SKSpriteNode(imageNamed:"SweetSpice")
        spiceSprite.xScale = 2 * (CGFloat(cocktailAmount) / 280)
        spiceSprite.yScale = 2 * (CGFloat(cocktailAmount) / 280)
        spiceSprite.position = CGPointMake(CGRectGetMidX(self.frame) - 10, CGRectGetMidY(self.frame) + 10 + 45)
        spiceSprite.zPosition = 3
        spiceSprite.alpha = 0.15
        self.addChild(spiceSprite)
        
        /*
        //radar map bg
        backgroundSprite = SKSpriteNode(imageNamed: "animationBg")
        backgroundSprite.xScale = 1.35
        backgroundSprite.yScale = 1.35
        backgroundSprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 45)
        backgroundSprite.zPosition = -1
        self.addChild(backgroundSprite)
        */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
