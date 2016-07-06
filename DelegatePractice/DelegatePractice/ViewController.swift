//
//  ViewController.swift
//  DelegatePractice
//
//  Created by KurtHo on 2016/7/5.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate {

    @IBOutlet weak var dataLabel: UILabel!
    
    func userDidEnterInformation() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC" {
            let secondVC: SecondViewController = segue.destinationViewController as! SecondViewController
            secondVC.delegate = self
        }
    }

}

