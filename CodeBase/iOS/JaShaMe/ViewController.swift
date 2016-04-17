//
//  ViewController.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/1/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit
import PKHUD
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var viewMap: GMSMapView!
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    var restaurantJSON : AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        self.labelLatitude.text = ""
        self.labelLongitude.text = ""
        
        let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(48.857165, longitude: 2.354613, zoom: 8.0)
        viewMap.camera = camera

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showProgress(sender: UIButton) {
        self.labelLatitude.text = String(locationManager.location!.coordinate.latitude)
        self.labelLongitude.text = String(locationManager.location!.coordinate.longitude)
        
        Alamofire.request(.GET, "https://raw.githubusercontent.com/blackie1019/JaShaMe/master/SampleData/Dinbendon/Map.json").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    self.restaurantJSON = response.result.value!
                    // Debug Data
                    let json = JSON(value)
                    print("JSON: \(json)")
                }
            case .Failure(let error):
                print(error)
            }
        }

        HUD.show(.Progress)
        
        delay(3.0) {
            self.gotoRandomRestaurant()
            HUD.flash(.Success, delay: 0.5)
        }
    }
    func gotoRandomRestaurant(){
        // Post URL to Get Restaurant
        //https://dinbendon.net/do/shopXml?westLng=121.49353201574706&eastLng=121.52700598425292&northLat=25.051469874207516&southLat=25.037861748246463&zoom=15
//        Alamofire.request(.GET, "https://raw.githubusercontent.com/blackie1019/JaShaMe/master/SampleData/Dinbendon/Map.json").validate().responseJSON { response in
//            switch response.result {
//            case .Success:
//                if let value = response.result.value {
//                    self.restaurantJSON = response.result.value!
//                    // Debug Data
//                    let json = JSON(value)
//                    print("JSON: \(json)")
//                }
//            case .Failure(let error):
//                print(error)
//            }
//        }
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        self.performSegueWithIdentifier("RestaurantList", sender:main)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "RestaurantList"{
            let obj = segue.destinationViewController as! RandomRestaurant
//            obj.Latitude = self.labelLatitude.text!
//            obj.Longitude = self.labelLongitude.text!
            obj.restaurantJSON = self.restaurantJSON
        }
    }
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}

// Get User Location information
extension ViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
            viewMap.myLocationEnabled = true
            viewMap.settings.myLocationButton = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            viewMap.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
        }
    }
}
