//
//  CanyoningCollectionViewController.swift
//  CollectionViewPractice
//
//  Created by KurtHo on 2016/6/27.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CollectionImageCell"

class CanyoningCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
//        let spacingWidth = Float(10)
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
//        let width = (Float(UIScreen.mainScreen().bounds.width) - spacingWidth * Float(4 + 1)) / 4
        let width = (UIScreen.mainScreen().bounds.width - 2*5)/4
        layout.itemSize = CGSizeMake(CGFloat(width), CGFloat(width) )
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//        layout.itemSize = CGSizeMake(CGFloat(width), CGFloat(width) )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowPhoto" {
//            let detailViewController = segue.destinationViewController as! ViewController
//            let cellSelected = sender as? UICollectionViewCell
//            
//           let indexPathDidSelect = self.collectionView?.indexPathForCell(cellSelected!)
//            
//            detailViewController.IMGView?.image =
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            let vc = segue.destinationViewController as! ViewController

            vc.image = UIImage(named: PicsList.pic[indexPath.row].name)!

            
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return PicsList.pic.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
//        cell.IMGView?.image = UIImage(named: PicsList.pic[indexPath.row].name)
        cell.IMGView?.image = UIImage(named: PicsList.pic[indexPath.row].name)

        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
