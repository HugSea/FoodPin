//
//  RestaurantDetailTableViewCell.swift
//  FoodPin
//
//  Created by 张庆杰 on 16/3/1.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLab: UILabel!
    @IBOutlet weak var valueLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
