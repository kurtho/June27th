//
//  ViewController.swift
//  FreeBuildCollectionView
//
//  Created by KurtHo on 2016/7/2.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectView: UICollectionView!
    var contentLayout = UICollectionViewFlowLayout()
    var headerDataSource : GeneralDataSource?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spacingWidth = Float(10)
        let width = (Float(UIScreen.mainScreen().bounds.width) - spacingWidth * Float(4 + 1)) / 2
        self.contentLayout.itemSize = CGSize(width: CGFloat(width), height: CGFloat(width))

        self.headerDataSource = HeaderTableDataSourceDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        // cell
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return self.appleProducts.count
        return PictrueList.pic.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! BodyCollectionViewCell
        //        cell.IMGView?.image = self.imageArray[indexPath.row]
        cell.bodyCellImage?.image = UIImage(named: PictrueList.pic[indexPath.row].name)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", forIndexPath: indexPath) 
        header.backgroundColor = UIColor.whiteColor()
        
        let collectionView = header.viewWithTag(1) as! UICollectionView
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.mainScreen().bounds.width, height: 220)
        let headerDataSource = self.headerDataSource as! HeaderTableDataSourceDelegate
        
        headerDataSource.collectionView = collectionView
        
        collectionView.dataSource = self.headerDataSource
        collectionView.delegate = self.headerDataSource
        collectionView.reloadData()
        
        

        
        
        return header
    }
    
    
    
}



protocol GeneralDataSource : UICollectionViewDelegate, UICollectionViewDataSource {
}






class HeaderTableDataSourceDelegate: NSObject, GeneralDataSource {
    
    let headerImages = [UIImage(named:"4"), UIImage(named:"5"), UIImage(named:"6")]
    
    private let reuseIdentifier = "HeaderImageCollectionCell"
    
    var collectionView : UICollectionView?
    var pageControl : UIPageControl?
    
    var timer : NSTimer?
    
    /**
     Setup before using this datasource.
     */
    func setup() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(HeaderTableDataSourceDelegate.counterTimer(_:)), userInfo: nil, repeats: true)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HeaderCollectionViewCell
            cell.headerImage.image = headerImages[indexPath.item]

//        cell.headerButton.setTitle("Browse more", forState: .Normal)
//        cell.headerButton.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        // Method 1. Add target action
        //        cell.actionButton.addTarget(self, action: #selector(handledActionButton(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        // Adding addtional potision value
        cell.headerButton.tag = indexPath.item
        
        // Method 2. Use GestureRecognizerClosures
//        cell.headerButton.onTap { (tapGestureRecognizer) in
//            print("Pressed GestureRecognizerClosures at \(indexPath.item as Int)!")
//        }
        
        return cell
    }
    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        let pageNum = round(scrollView.contentOffset.x / scrollView.frame.size.width)
//        self.pageControl!.currentPage = Int(pageNum)
//    }
//    
//    func handledActionButton(sender:AnyObject?) {
//        let currentButton = sender as! UIButton
//        print("Pressed at \(currentButton.tag as Int)!")
//    }
    
    // MARK: - Private
    
    /**
     We be called when user select dot form page control.
     
     - Parameters
     - sender: Could be any
     */
    func pageChanged(sender:AnyObject) {
        let pageControl = sender as? UIPageControl
        let x = CGFloat(pageControl!.currentPage) * self.collectionView!.frame.size.width
        self.collectionView!.setContentOffset(CGPointMake(x, 0), animated: true)
        
    }
    
    /**
     A counter timer for automatic scroll our header collection view.
     
     - Parameters
     - sender: The trigger object, could be any.
     */
    func counterTimer(sender:AnyObject) {
        let nextIndex = self.pageControl!.currentPage + 1 < self.headerImages.count ? self.pageControl!.currentPage + 1 : 0
        
        self.pageControl!.currentPage = nextIndex
        
        let x = CGFloat(nextIndex) * self.collectionView!.frame.size.width
        self.collectionView!.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
}
