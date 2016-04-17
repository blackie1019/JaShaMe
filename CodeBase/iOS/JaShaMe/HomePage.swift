//
//  RandomTest.swift
//  JaShaMe
//
//  Created by Wang Ming-ren on 4/10/16.
//  Copyright © 2016 BK Studio X Hotdog's shop. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    var labelJaShaMe: UILabel!
    var labelDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelJaShaMe = UILabel()
        labelJaShaMe.text = "JaShaMe"
        labelJaShaMe.font = UIFont.systemFontOfSize(48)
        labelJaShaMe.sizeToFit()
        labelJaShaMe.center = CGPoint(x: 150, y: 40)
        view.addSubview(labelJaShaMe)
        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: {
            self.labelJaShaMe.center = CGPoint(x: 150, y: 40 + 200)
            }, completion: nil)
        
        labelDescription = UILabel()
        labelDescription.text = "Search Restaurant \n Around You!!"
        labelDescription.font = UIFont.systemFontOfSize(30)
        labelDescription.numberOfLines = 2
        labelDescription.sizeToFit()
        labelDescription.center = CGPoint(x: 250, y: 90)
        labelDescription.alpha = 0
        view.addSubview(labelDescription)

        UIView.animateWithDuration(2.0, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.TransitionNone, animations: {
            self.labelDescription.alpha = 1
            self.labelDescription.center = CGPoint(x: 250, y: 90 + 200)
            }, completion: nil)
        
        //
    }
    
    
    override func viewDidAppear(animated: Bool) {
        // Set Timer
        self.performSelector(#selector(HomePage.gotoMain), withObject: nil, afterDelay: 3)
    }
    
    func gotoMain () {
        self.performSegueWithIdentifier("gotoMain", sender: self)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
