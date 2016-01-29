//
//  ViewController.swift
//  Animations
//
//  Created by Hoyoung Jung on 1/23/16.
//  Copyright © 2016 Hoyoung Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var i = 1
    
    var timer = NSTimer()
    
    @IBOutlet var minionImage: UIImageView!
    
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(sender: AnyObject) {
            timer.invalidate()
    }
    
    @IBAction func reset(sender: AnyObject) {
        i = 1
        minionImage.image = UIImage(named: "frame\(i).png")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func doAnimation() {
        if i == 90 {
            
            i = 1
            
        } else {
            
            i++
            
            let imageName = "frame\(i).png"
            minionImage.image = UIImage(named: imageName)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


// Animation fades in using alpha
    override func viewDidLayoutSubviews() {
        minionImage.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.minionImage.alpha = 1
        })
    }


/*
// Animation fades in using size and location
    override func viewDidLayoutSubviews() {
        minionImage.frame = CGRectMake(100, 20, 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.minionImage.frame = CGRectMake(100, 20, 100, 200)
        })
    }
*/

/*
// Animation zooms the image from the left to the center of the screen
    override func viewDidLayoutSubviews() {
        minionImage.center = CGPointMake(minionImage.center.x-400, minionImage.center.y)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            
            minionImage.center = CGPointMake(minionImage.center.x+400, minionImage.center.y)
            
        })
    }
*/

}

