//
//  RandomRestaurant.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/1/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit

class RandomRestaurant: UIViewController {
    
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    
    var Latitude = String()
    var Longitude = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelLatitude.text = Latitude
        labelLongitude.text = Longitude
    }
}
