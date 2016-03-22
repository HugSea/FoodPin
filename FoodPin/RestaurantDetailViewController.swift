//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by 张庆杰 on 16/2/29.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ratingButton: UIButton!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(data: restaurant.image)
        tableView.tableFooterView = UIView(frame: CGRectZero)
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        title = restaurant.name
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if let rating = restaurant?.rating where rating != ""{
            ratingButton.setImage(UIImage(named: rating), forState: .Normal)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(segue:UIStoryboardSegue) {
        if let reviewViewController = segue.sourceViewController as? ReviewViewController {
            if let rating = reviewViewController.rating {
                restaurant.rating = rating
                ratingButton.setImage(UIImage(named: rating), forState: .Normal)
                
                if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
                    do {
                        try managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap" {
            let destController = segue.destinationViewController as! MapViewController
            destController.restaurant = restaurant
        }
    }
    
// MARK: UITableViewDataSource/Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestaurantDetailTableViewCell", forIndexPath: indexPath) as! RestaurantDetailTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        switch indexPath.row {
        case 0:
            cell.fieldLab.text = NSLocalizedString("Name", comment: "Name Field")
            cell.valueLab.text = restaurant.name
        case 1:
            cell.fieldLab.text = NSLocalizedString("Type", comment: "Type Field")
            cell.valueLab.text = restaurant.type
        case 2:
            cell.fieldLab.text = NSLocalizedString("Location", comment: "Location/Address Field")
            cell.valueLab.text = restaurant.location
        case 3:
            cell.fieldLab.text = NSLocalizedString("Phone", comment: "Phone Field")
            cell.valueLab.text = restaurant.phoneNumber
        case 4:
            cell.fieldLab.text = NSLocalizedString("Been here", comment: "Have you been here Field")
            cell.valueLab.text = restaurant.isVisited.boolValue ? NSLocalizedString("Yes, I've been here before", comment: "Yes, I've been here before") : NSLocalizedString("No", comment: "No, I haven't been here")
        default:
            cell.fieldLab.text = ""
            cell.valueLab.text = ""
        }
        return cell
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
