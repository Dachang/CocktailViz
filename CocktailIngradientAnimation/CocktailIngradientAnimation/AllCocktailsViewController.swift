//
//  AllCocktailsViewController.swift
//  CocktailViz
//
//  Created by 大畅 on 16/5/25.
//  Copyright © 2016年 Dachang. All rights reserved.
//

import UIKit

class AllCocktailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var cocktailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cocktailCollectionView.delegate = self
        cocktailCollectionView.dataSource = self
        cocktailCollectionView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UICollectionView DataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 48
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CocktailCollectionViewCell", forIndexPath: indexPath) as! CocktailCollectionViewCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.cellGradientBackgroundView.backgroundColor = UIColor(red: 217.0/255.0, green: 114.0/255.0, blue: 153.0/255.0, alpha: 1)
        if indexPath.row == 1 {
            cell.cocktailNameLabel.text = "EARTHQUAKE"
            cell.cellGradientBackgroundView.backgroundColor = UIColor(red: 245.0/255.0, green: 182.0/255.0, blue: 6.0/255.0, alpha: 1)
        }
        return cell
    }
    
    //MARK: UICollectionView Delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let visualVC: GameViewController = storyboard.instantiateViewControllerWithIdentifier("GameViewController") as! GameViewController
        
        if indexPath.row == 1 {
            visualVC.cocktailName = "EARTHQUAKE"
            visualVC.baseWineAmount = 20
            visualVC.liquorAmount = 20
            visualVC.juiceAmount = 0
            visualVC.sodaAmount = 0
            visualVC.spiceAmount = 0
            visualVC.degreeOfAlcohol = 40
            visualVC.cocktailGradients = [UIColor(red: 168.0/255.0, green: 193.0/255.0, blue: 4.0/255.0, alpha: 1).CGColor, UIColor(red: 245.0/255.0, green: 182.0/255.0, blue: 6.0/255.0, alpha: 1).CGColor,UIColor(red: 244.0/255.0, green: 160.0/255.0, blue: 5.0/255.0, alpha: 1).CGColor]
            
            visualVC.valueOfSalty = 17
            visualVC.valueOfSavory = 17
            visualVC.valueOfSour = 83
            visualVC.valueOfBitter = 17
            visualVC.valueOfSweet = 17
            visualVC.valueOfSpicy = 0
        }
        
        self.navigationController?.pushViewController(visualVC, animated: true)
    }
    
    //MARK: UICollectionViewDelegate FlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((UIScreen.mainScreen().bounds.size.width - 1) / 2, (UIScreen.mainScreen().bounds.size.width - 1) / 2)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
