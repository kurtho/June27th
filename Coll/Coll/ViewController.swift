//
//  ViewController.swift
//  Coll
//
//  Created by KurtHo on 2016/7/6.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectView: UICollectionView!
    
    let headerImages = [UIImage(named:"4"), UIImage(named:"5"), UIImage(named:"6")]

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.imageView.image = headerImages[indexPath.item]
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

