//
//  ViewController.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/1/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit
import PKHUD

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var viewMap: GMSMapView!
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!

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
        self.performSelector(#selector(ViewController.gotoRandomRestaurant), withObject: nil, afterDelay: 3)
        
        self.labelLatitude.text = String(locationManager.location!.coordinate.latitude)
        self.labelLongitude.text = String(locationManager.location!.coordinate.longitude)
        HUD.show(.Progress)
    
    }
    func gotoRandomRestaurant(){
        HUD.hide()
        let main = UIStoryboard(name: "Main", bundle: nil)
//        let nextPage = main.instantiateViewControllerWithIdentifier("RandomRestaurant")
//        
//        (nextPage as! RandomRestaurant).Longitude = self.labelLongitude.text!
//        (nextPage as! RandomRestaurant).Latitude = self.labelLatitude.text!
        
        self.performSegueWithIdentifier("AAA", sender:main)
//        self.presentViewController(nextPage  , animated: true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AAA"{
            let obj = segue.destinationViewController as! RandomRestaurant
            obj.Latitude = self.labelLatitude.text!
            obj.Longitude = self.labelLongitude.text!
        }
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
