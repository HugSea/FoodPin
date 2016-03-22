//
//  Restaurant.swift
//  FoodPin
//
//  Created by 张庆杰 on 16/2/29.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import Foundation
import CoreData

class Restaurant:NSManagedObject {
    
    @NSManaged var name:String?
    @NSManaged var type:String?
    @NSManaged var location:String?
    @NSManaged var phoneNumber:String
    @NSManaged var isVisited:NSNumber
    @NSManaged var image:NSData
    @NSManaged var rating:String
    
//    var name = ""
//    var type = ""
//    var location = ""
//    var phoneNumber = ""
//    var image = ""
//    var isVisited = false
//    init(name:String, type:String, location:String, phoneNumber:String, image:NSData, isVisited:Bool) {
//        self.name = name
//        self.type = type
//        self.location = location
//        self.phoneNumber = phoneNumber
//        self.image = image
//        self.isVisited = isVisited
//    }
}
