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

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet weak var FBView: UIView!

    let logginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
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
        print("fetch profile")
        let parameters = ["fields" : "email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error)
            }
            if let email = result["email"] as? String {
                print(email)
            }
            
            if let picture = result["pictrue"] as? NSDictionary, data = picture["data"] as? NSDictionary,
                url = data["url"] as? String  {
                print(url)
            }
                print(result)
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("complete login")
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

