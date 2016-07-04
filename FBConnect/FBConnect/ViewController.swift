//
//  ViewController.swift
//  FBConnect
//
//  Created by KurtHo on 2016/6/28.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKCoreKit
import FBSDKLoginKit
import SDWebImage
import Alamofire
import SwiftyJSON
import FirebaseAuth

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet weak var FBView: UIView!
    @IBOutlet weak var urlImageOutlet: UIImageView!
        var urlImage : String = ""
    
        let logginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["public_profile", "email", "user_friends"]
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logginButton)
        logginButton.center = self.FBView.center
        self.view.addSubview(logginButton)
//        logginButton.delegate = self
        if let token = FBSDKAccessToken.currentAccessToken() {
            fetchProfile()
            print("token = \(token)")
            
        }
    }
    
    
    
    func fetchProfile() {
//        print("fetch profile")
        let parameters = ["fields" : "gender, email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error)
            }
//            if let email = result["email"] as? String {
//                print(email)
//            }
//            
//            if let picture = result["pictrue"] as? NSDictionary, data = picture["data"] as? NSDictionary,
//                url = data["url"] as? String  {
//                print(url)
//                
//            }
                print("result = \(result)")
            
            if let resultDictionary : Dictionary<String, AnyObject> = result as? Dictionary<String, AnyObject> {
                print("email: \(resultDictionary["email"] as! String)")
                print("first_name: \(resultDictionary["first_name"] as! String)")
                print("gender: \(resultDictionary["gender"] as! String)")

            }
            
        }
    }
    
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("complete login")
        let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
        FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            // ...
            print("User sign in Firebase App")
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

