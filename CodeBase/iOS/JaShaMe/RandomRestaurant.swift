//
//  RandomRestaurant.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/1/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit
import SwiftyJSON

class RandomRestaurant: UIViewController, NSURLSessionDelegate {
    
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    @IBOutlet weak var targetRestaurant: UILabel!
    
    var Latitude = String()
    var Longitude = String()
    var restaurantJSON: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let json = JSON(restaurantJSON!)
        let restaurantCount = json["markers"]["marker"].count
        
        // Get all restaurant's name
        var restaurantList = [String]()
        for index in 0...restaurantCount-1 {
            restaurantList.append(json["markers"]["marker"][index]["-shopName"].stringValue)
        }
        
        // Random a restaurant
        let randomIndex = Int(arc4random_uniform(UInt32(restaurantCount)))
        
        print("restaurantCount: \(restaurantCount)")
        print("restaurantList: \(restaurantList)")
        print("targetRestaurant: \(restaurantList[randomIndex])")

        targetRestaurant.text = restaurantList[randomIndex]
        labelLatitude.text = json["markers"]["marker"][randomIndex]["-lat"].stringValue
        labelLongitude.text = json["markers"]["marker"][randomIndex]["-lng"].stringValue

        
//        labelLatitude.text = Latitude
//        labelLongitude.text = Longitude
    }
}
