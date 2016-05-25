//
//  GameViewController.swift
//  CocktailIngradientAnimation
//
//  Created by 大畅 on 16/5/12.
//  Copyright (c) 2016年 Dachang. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var generalTimer = NSTimer()
    
    var baseWineAmount : Int = 30
    var liquorAmount : Int = 32
    var juiceAmount : Int = 2
    var sodaAmount : Int = 0
    var spiceAmount : Int = 2
    
    var cocktailName : String = "CHERRY BLOSSOM"
    var degreeOfAlcohol : Int = 28
    var cocktailGradients = [UIColor(red: 239.0/255.0, green: 79.0/255.0, blue: 71.0/255.0, alpha: 1).CGColor, UIColor(red: 217.0/255.0, green: 114.0/255.0, blue: 153.0/255.0, alpha: 1).CGColor,UIColor(red: 218.0/255.0, green: 91.0/255.0, blue: 87.0/255.0, alpha: 1).CGColor]
    
    var valueOfSalty : Int = 17
    var valueOfSavory : Int = 17
    var valueOfSour : Int = 17
    var valueOfBitter : Int = 17
    var valueOfSweet : Int = 83
    var valueOfSpicy : Int = 0
    
    var adjustFactorOfSalty : CGFloat = 2
    var adjustFactorOfSavory : CGFloat = 0.5
    var adjustFactorOfSour : CGFloat = 3
    var adjustFactorOfBitter : CGFloat = 4
    var adjustFactorOfSweet : CGFloat = 1
    var adjustFactorOfSpicy : CGFloat = 5
    
    var sumOfFactor : CGFloat = 0
    var sumOfValue : Int = 0
    
    let FrequencyOfBaseWine : CGFloat = 0.2
    let FrequencyOfLiquorWine : CGFloat = 0.4
    let FrequencyOfJuice : CGFloat = 0.5
    let FrequencyOfSoda : CGFloat = 0.3
    let FrequenctOfSpice : CGFloat = 0.1
    
    var gameScene : GameScene!
    
    @IBOutlet weak var cocktailGradientColorView: CocktailGradientView!
    
    @IBOutlet weak var baseWineINdicator: UIView!
    @IBOutlet weak var liquorIndicator: UIView!
    @IBOutlet weak var juiceIndicator: UIView!
    @IBOutlet weak var sodaIndicator: UIView!
    @IBOutlet weak var spiceIndicator: UIView!
    
    @IBOutlet weak var baseWineLabel: UILabel!
    @IBOutlet weak var liquorLabel: UILabel!
    @IBOutlet weak var juiceLabel: UILabel!
    @IBOutlet weak var sodaLabel: UILabel!
    @IBOutlet weak var spiceLabel: UILabel!
    
    @IBOutlet weak var baseWineWidth: NSLayoutConstraint!
    @IBOutlet weak var liquorWidth: NSLayoutConstraint!
    @IBOutlet weak var juiceWidth: NSLayoutConstraint!
    @IBOutlet weak var sodaWidth: NSLayoutConstraint!
    @IBOutlet weak var spiceWidth: NSLayoutConstraint!
    
    var waveAmpRate : CGFloat = 0.1
    
    @IBOutlet weak var baseWineWave: OceanView! {
        didSet {
            self.baseWineWave.alpha = 0.5
            calculateAdjustFactor()
            self.baseWineWave.frequency = 0.2 * (sumOfFactor / CGFloat(sumOfValue)) * (sumOfFactor / CGFloat(sumOfValue))
            self.baseWineWave.waveColor = UIColor.whiteColor()
            self.baseWineWave.amplitudeRate = waveAmpRate * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28
            self.baseWineWave.update(0)
        }
    }
    @IBOutlet weak var liquorWineWave: OceanView! {
        didSet {
            self.liquorWineWave.alpha = 0.4
            calculateAdjustFactor()
            self.liquorWineWave.frequency = 0.4 * (sumOfFactor / CGFloat(sumOfValue)) * (sumOfFactor / CGFloat(sumOfValue))
            self.liquorWineWave.waveColor = UIColor.whiteColor()
            self.liquorWineWave.amplitudeRate = waveAmpRate * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28
            self.liquorWineWave.update(0)
        }
    }
    
    @IBOutlet weak var juiceWave: OceanView! {
        didSet {
            self.juiceWave.alpha = 0.3
            calculateAdjustFactor()
            self.juiceWave.frequency = 0.5 * (sumOfFactor / CGFloat(sumOfValue)) * (sumOfFactor / CGFloat(sumOfValue))
            self.juiceWave.waveColor = UIColor.whiteColor()
            self.juiceWave.amplitudeRate = waveAmpRate * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28
            self.juiceWave.update(0)
        }
    }
    
    @IBOutlet weak var sodaWave: OceanView! {
        didSet {
            self.sodaWave.alpha = 0.2
            calculateAdjustFactor()
            self.sodaWave.frequency = 0.3 * (sumOfFactor / CGFloat(sumOfValue)) * (sumOfFactor / CGFloat(sumOfValue))
            self.sodaWave.waveColor = UIColor.whiteColor()
            self.sodaWave.amplitudeRate = waveAmpRate * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28
            self.sodaWave.update(0)
        }
    }
    
    @IBOutlet weak var spiceWave: OceanView! {
        didSet {
            self.spiceWave.alpha = 0.1
            calculateAdjustFactor()
            self.spiceWave.frequency = 0.1 * (sumOfFactor / CGFloat(sumOfValue)) * (sumOfFactor / CGFloat(sumOfValue))
            self.spiceWave.waveColor = UIColor.whiteColor()
            self.spiceWave.amplitudeRate = waveAmpRate * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28 * CGFloat(degreeOfAlcohol) / 28
            self.spiceWave.update(0)
        }
    }
    
    @IBOutlet weak var visualOnButton: UIButton! {
        didSet {
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(GameViewController.longPress(_:)))
            longPress.minimumPressDuration = 0.2
            self.visualOnButton.addGestureRecognizer(longPress)
        }
    }
    
    func scheduledTimerWithTimeInterval(){
        generalTimer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: #selector(GameViewController.updateWave), userInfo: nil, repeats: true)
    }
    
    func updateCounting(){
        NSLog("counting..")
    }
    
    func calculateAdjustFactor() {
        let saltyFactor : CGFloat = CGFloat(valueOfSalty) * adjustFactorOfSalty
        let sourFactor : CGFloat = CGFloat(valueOfSour) * adjustFactorOfSour
        let spicyFactor : CGFloat = CGFloat(valueOfSpicy) * adjustFactorOfSpicy
        let bitterFactor : CGFloat = CGFloat(valueOfBitter) * adjustFactorOfBitter
        let sweetFactor : CGFloat = CGFloat(valueOfSweet) * adjustFactorOfSweet
        let savoryFactor : CGFloat = CGFloat(valueOfSavory) * adjustFactorOfSavory
        
        sumOfFactor = saltyFactor + sourFactor + spicyFactor + bitterFactor + sweetFactor + savoryFactor
        sumOfValue = valueOfSalty + valueOfSour + valueOfSpicy + valueOfBitter + valueOfSweet + valueOfSavory
    }
    
    @objc private func updateWave() {
        self.baseWineWave.update(2)
        self.liquorWineWave.update(1)
        self.juiceWave.update(2)
        self.sodaWave.update(1)
        self.spiceWave.update(2)
        self.performSelector(#selector(GameViewController.longPress(_:)), withObject: nil, afterDelay: 0.02)
        self.visualOnButton.alpha = 0.3
    }
    
    func longPress(sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .Began:
            self.updateWave()
        case .Changed:
            break
        case .Ended:
            self.baseWineWave.update(0)
            self.liquorWineWave.update(0)
            self.juiceWave.update(0)
            self.sodaWave.update(0)
            self.spiceWave.update(0)
            NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: #selector(GameViewController.longPress(_:)), object: nil)
            self.visualOnButton.alpha = 1
        default:
            self.updateWave()
        }
    }
    
    func checkIngredients() -> Void {
        baseWineWave.alpha = baseWineAmount == 0 ? 0 : 0.5
        liquorWineWave.alpha = liquorAmount == 0 ? 0 : 0.4
        juiceWave.alpha = juiceAmount == 0 ? 0 : 0.3
        sodaWave.alpha = sodaAmount == 0 ? 0 : 0.2
        spiceWave.alpha = spiceAmount == 0 ? 0 : 0.1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = cocktailName
        cocktailGradientColorView.gradientColors = cocktailGradients
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        baseWineLabel.text = String(baseWineAmount) + " ml"
        liquorLabel.text = String(liquorAmount) + " ml"
        juiceLabel.text = String(juiceAmount) + " ml"
        sodaLabel.text = String(sodaAmount) + " ml"
        spiceLabel.text = String(spiceAmount) + " ml"
        
        baseWineWidth.constant = CGFloat(baseWineAmount)
        liquorWidth.constant = CGFloat(liquorAmount)
        juiceWidth.constant = CGFloat(juiceAmount)
        sodaWidth.constant = CGFloat(sodaAmount)
        spiceWidth.constant = CGFloat(spiceAmount)
        
        checkIngredients()
        self.view.setNeedsLayout()
        self.view.setNeedsDisplay()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
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
}
