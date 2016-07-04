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
            
            let data = NSData(contentsOfURL: photoUrl!)
            self.fbProfilePic.image = UIImage(data: data!)
                    // Do any additional setup after loading the view.

        } else {
            // No user is signed in.
        }


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
