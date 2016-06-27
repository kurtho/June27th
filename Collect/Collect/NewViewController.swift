//
//  NewViewController.swift
//  Collect
//
//  Created by KurtHo on 2016/6/27.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {
    @IBOutlet weak var IMGView: UIImageView!

    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.IMGView.image = self.image
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
