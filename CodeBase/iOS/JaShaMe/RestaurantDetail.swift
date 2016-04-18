//
//  RestaurantDetail.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/19/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit

class RestaurantDetail: UIViewController {
    @IBOutlet weak var webVeiwDetail: UIWebView!
    @IBOutlet weak var viewMap: GMSMapView!
    
    var Latitude = String()
    var Longitude = String()
    var RestaurantDetail = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        webVeiwDetail.loadHTMLString(RestaurantDetail, baseURL: nil)
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(Double(Latitude)!, longitude: Double(Longitude)!, zoom: 16.0)
        viewMap.camera = camera
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
