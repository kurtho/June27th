//
//  ViewController.swift
//  CollectionView0701
//
//  Created by KurtHo on 2016/7/1.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON
import Alamofire

class ViewController: UIViewController  {
@IBOutlet weak var headCollectionView: UICollectionView!

let headerImages = [UIImage(named:"animal"), UIImage(named:"match"), UIImage(named:"girl")]
    
var pics = [PetList]()

    private let reuseIdentifier = "HeaderImageButtonCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String = "http://data.taipei/opendata/datalist/apiAccess"
        Alamofire.request(.GET, urlString, parameters: ["scope" : "resourceAquire", "rid": "f4a75ba9-7721-4363-884d-c3820b0b917c", "offset": "230", "limit": "30"])
            .responseJSON {
                response in
                                
                if let data = response.result.value {
                    let json = JSON(data)
                    let petList = json["result"]["results"].arrayValue
                    
                    for pet in petList {

                        let pets = PetList()
                        
                        pets.petName = pet["Name"].stringValue
                        pets.petImage = pet["ImageName"].stringValue
                        self.pics.append(pets)
                        print("pics ~~ \(self.pics)")

                    }
                }
//                self.headCollectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pics.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HeaderImageButtonCell
        
        let currentImage = headerImages[indexPath.item]
        
        cell.imageView.image = currentImage

    
        print("cell ~~\(cell)")
        return cell
}

class PetList {
    var petName: String = ""
    var petDescription: String = ""
    var petImage: String  = ""
}
}