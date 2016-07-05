//
//  HomeViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/6/29.
//  Copyright © 2016年 Kurt. All rights reserved.
//
import FBSDKCoreKit
import FirebaseAuth
import Firebase
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var fbProfilePic: UIImageView!
    @IBOutlet weak var fbName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var traitLabel: UILabel!
    @IBOutlet weak var fbProfileImage: UIBarButtonItem!
    
    
    
    @IBOutlet weak var contentLabel: UILabel!
//    var profileImage: ProfileImageList!
    
    @IBAction func didTapLogOut(sender: AnyObject) {
        try! FIRAuth.auth()!.signOut()
        FBSDKAccessToken.setCurrentAccessToken(nil)
        
        let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController : UIViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("LogginView")
        self.presentViewController(viewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbProfilePic.layer.cornerRadius = self.fbProfilePic.frame.size.width/4
        self.fbProfilePic.clipsToBounds = true

        
        if let user = FIRAuth.auth()?.currentUser {
            let name = user.displayName
//            let email = user.email
            let photoUrl = user.photoURL
//            let uid = user.uid;
            
            self.fbName.text = name
            if let photoURL = photoUrl {
                if let data = NSData(contentsOfURL: photoURL) {
                    self.fbProfilePic.image = UIImage(data: data)

                }
            }
            
                    // Do any additional setup after loading the view.

        } else {
            // No user is signed in.
        }
        profileImage.image = UIImage(named: ProfileImageList.pic[0].name)
        contentLabel.text = ProfileImageList.pic[0].description
        nameLabel.text = "蒙奇・D・魯夫"
        ageLabel.text = "30"
        placeLabel.text = "海上"
        traitLabel.text = "吃肉、草帽、橡膠、當上海賊王"
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
        // Dispose of any resources that can be recreated.
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
