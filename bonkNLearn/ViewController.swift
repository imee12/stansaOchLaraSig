//
//  ViewController.swift
//  bonkNLearn
//
//  Created by Dynepic on 11/24/15.
//  Copyright © 2015 Dynepic Inc. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
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



//import UIKit
//import CoreMotion
//import AVFoundation
//
//class ViewController: UIViewController {
//
//    var uno = AVAudioPlayer()
//    var motionManager = CMMotionManager()
//
//    
//    override func viewDidLoad() {
//        //Set Motion Manager Properties  - how often check for accel,gyro 0.2 is every 2 10ths sec
//        motionManager.accelerometerUpdateInterval = 0.2
//        motionManager.gyroUpdateInterval = 0.2
//        
//        //Start Recording Data
//        
//        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!,
//            withHandler: { (accelerometerData, error) -> Void in self.outputAccelerationData(accelerometerData!.acceleration)
//                if (error != nil) {
//                    print("\(error)")
//                    
//                }
//                
//        })
//        
//        
////        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!,
////            withHandler: { (gyroData, error) -> Void in self.outputRotationData(gyroData!.rotationRate)
////                if (error != nil) {
////                    print("\(error)")
////                    
////                }
////                
////        })
//        
//        
//        
//        super.viewDidLoad()
//        
//        uno = self.setupAudioPlayerWithFile("one", type:"mp3")
//       
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//
//    func setupAudioPlayerWithFile(file: String, type: String) -> AVAudioPlayer  {
//        
//        if let url = NSBundle.mainBundle().URLForResource(file, withExtension: type) {
//            do {
//                return try AVAudioPlayer(contentsOfURL: url)
//            } catch let error as NSError {
//                print(error.localizedDescription)
//            }
//        }
//        return AVAudioPlayer()
//    }
//
//    func outputAccelerationData(acceleration: CMAcceleration) {
//        
////        
////        accX?.text = "\(acceleration.x).2fg"
////        
////        if fabs(acceleration.x) > fabs(currentMaxAccelX)
////        {
////            currentMaxAccelX = acceleration.x
////        }
////        
////        accY?.text = "\(acceleration.y).2fg"
////        
////        if fabs(acceleration.y) > fabs(currentMaxAccelY)
////        {
////            currentMaxAccelY = acceleration.y
////        }
////        
////        accZ?.text = "\(acceleration.z).2fg"
//        
//        // if acc.x or acc.y or acc.z <  +/- 0.4
//        
//        if (acceleration.z < -0.80) {
//            print("Z is here.")
//            self.performSegueWithIdentifier("goToUsers", sender: self)
//         //   stopAccelerometerUpdates()
//            
//            
//            
//            
//        
////        if fabs(acceleration.z) > fabs(currentMaxAccelZ)
////        {
////            currentMaxAccelZ = acceleration.z
////        }
////        
////        maxAccX?.text = "\(currentMaxAccelX) .2f"
////        maxAccY?.text = "\(currentMaxAccelY) .2f"
//      //  maxAccZ?.text = "\(currentMaxAccelZ) .2f"
//        
//    }
//    }
//    
//    
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
