//
//  ViewController.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/1/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        IJProgressView.shared.showProgressView(view)
//        setCloseTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func close() {
        IJProgressView.shared.hideProgressView()
    }
    
//    func setCloseTimer() {
//        _ = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(ViewController.close), userInfo: nil, repeats: false)
//    }
    
    @IBAction func showProgress(sender: UIButton) {
        self.performSelector(#selector(ViewController.gotoRandomRestaurant), withObject: nil, afterDelay: 3)
        IJProgressView.shared.showProgressView(view)
    
    }
    func gotoRandomRestaurant(){
            close()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let nextPage = main.instantiateViewControllerWithIdentifier("RandomRestaurant")
        self.presentViewController(nextPage  , animated: true, completion: nil)
    }
    
}