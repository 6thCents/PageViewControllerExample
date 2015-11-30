//
//  PageContentViewController.swift
//  PageViewControllerExample
//
//  Created by David Rollins on 11/27/15.
//  Copyright © 2015 David Rollins. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    var pageIndex:Int = 0
    
    var titleText:String = ""
    var imageFile:String = "";

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView.image = UIImage(named:self.imageFile);
        self.titleLabel.text = self.titleText;

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
