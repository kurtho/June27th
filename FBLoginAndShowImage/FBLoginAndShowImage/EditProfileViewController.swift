//
//  EditProfileViewController.swift
//  FBLoginAndShowImage
//
//  Created by KurtHo on 2016/7/5.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit


@objc protocol ChangeFbProfileDelegate : class {
    func changeProfileImage()
    func changeProfileNameLabel()
}

class EditProfileViewController: UIViewController {
    weak var delegate : ChangeFbProfileDelegate?
    
    
    
    @IBOutlet weak var editImage: UIButton!
    
    @IBAction func editImageButton(sender: AnyObject) {
        delegate?.changeProfileImage()
        delegate?.changeProfileNameLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        editImage.setImage(UIImage(named: "nami"), forState: UIControlState.Normal)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
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
