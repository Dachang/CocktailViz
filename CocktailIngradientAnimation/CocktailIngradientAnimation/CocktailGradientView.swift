//
//  CocktailGradientView.swift
//  CocktailViz
//
//  Created by 大畅 on 16/5/25.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class CocktailGradientView: UIView {
    
    var gradientColors = [UIColor(red: 239.0/255.0, green: 79.0/255.0, blue: 71.0/255.0, alpha: 1).CGColor, UIColor(red: 217.0/255.0, green: 114.0/255.0, blue: 153.0/255.0, alpha: 1).CGColor,UIColor(red: 218.0/255.0, green: 91.0/255.0, blue: 87.0/255.0, alpha: 1).CGColor]
    
    override func drawRect(rect: CGRect) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = gradientColors
        self.layer.insertSublayer(gradient, atIndex: 0)
    }
}
