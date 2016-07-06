//
//  SecondViewController.swift
//  DelegatePractice
//
//  Created by KurtHo on 2016/7/5.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

@objc protocol DataEnteredDelegate: class {
    func userDidEnterInformation(info: String)
}

class SecondViewController: UIViewController {
    var delegate: DataEnteredDelegate? = nil
    
    
    
    @IBOutlet weak var textField: UITextField!


    @IBAction func sendData(sender: AnyObject) {
        if delegate != nil {
            let information: String = textField.text!
            delegate!.userDidEnterInformation(information)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
