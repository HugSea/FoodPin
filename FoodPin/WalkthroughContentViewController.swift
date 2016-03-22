//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by 张庆杰 on 16/3/11.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    @IBOutlet var headingLabel:UILabel!
    @IBOutlet var contentLabel:UILabel!
    @IBOutlet var contentImageView:UIImageView!
    @IBOutlet var pageControl:UIPageControl!
    @IBOutlet var forwardBtn:UIButton!
    
    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        pageControl.currentPage = index
        
        switch index {
        case 0...1:
            forwardBtn.setTitle("Next", forState: .Normal)
        case 2:
            forwardBtn.setTitle("Done", forState: .Normal)
        default:
            break
        }
    }

    @IBAction func nextAction(sender: UIButton) {
        switch index {
        case 0...1:
            let pageViewController = parentViewController as!WalkthroughPageViewController
            pageViewController.forward(index)
        case 2:
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "ViewedWalkthrough");
            dismissViewControllerAnimated(true, completion: nil)
        default:
            break
        }
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
