//
//  HomeViewController.swift
//  CocktailIngradientAnimation
//
//  Created by 大畅 on 16/5/12.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit
import SpriteKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var baseWineINdicator: UIView!
    @IBOutlet weak var liquorIndicator: UIView!
    @IBOutlet weak var juiceIndicator: UIView!
    @IBOutlet weak var sodaIndicator: UIView!
    @IBOutlet weak var spiceIndicator: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let scene = SecondGameScene(fileNamed:"SecondGameScene") {
            // Configure the view.
            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
