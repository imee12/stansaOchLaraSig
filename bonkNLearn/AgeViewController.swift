//
//  AgeViewController.swift
//  BonkNLearn
//
//  Created by Imee Cuison on 12/2/15.
//  Copyright © 2015 Dynepic Inc. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class AgeViewController: UIViewController {

    override func viewDidLoad() {
        print("age menu here")
        
        let motionManager = CMMotionManager()

        motionManager.stopAccelerometerUpdates()

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
