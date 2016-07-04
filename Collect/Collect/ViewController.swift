//
//  ViewController.swift
//  Collect
//
//  Created by KurtHo on 2016/6/27.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = self.collectionView as! UICollectionViewFlowLayout
//        let width = (UIScreen.mainScreen().bounds.width - 2*5)/4
//        layout.itemSize = CGSizeMake(CGFloat(width), CGFloat(width) )
//        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.appleProducts.count
        return PicsList.pic.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
//        cell.IMGView?.image = self.imageArray[indexPath.row]
            cell.IMGView?.image = UIImage(named: PicsList.pic[indexPath.row].name)
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage" {
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let vc = segue.destinationViewController as! NewViewController
            
//            vc.image = self.imageArray[indexPath.row]!
            vc.image = UIImage(named: PicsList.pic[indexPath.row].name)!
//            vc.image = collectionView.indexPathsForSelectedItems()?
        }
    }
    
}

