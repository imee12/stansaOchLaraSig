//
//  ThreeViewController.swift
//  bonkNLearn
//
//  Created by Imee Cuison on 11/26/15.
//  Copyright © 2015 Dynepic Inc. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class ThreeViewController: UIViewController {
    
    var three = AVAudioPlayer()
    var motionManager = CMMotionManager()
    
    
    override func viewDidLoad() {
        //Set Motion Manager Properties  - how often check for accel,gyro 0.2 is every 2 10ths sec
        motionManager.accelerometerUpdateInterval = 0.2
        three = self.setupAudioPlayerWithFile("Three", type:"mp3")
        
        
        three.play()
        delay(1){
            self.three.stop()
            
        }
        
        
        delay(3) {
            self.restartAccelUpdates()
        }
        
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func restartAccelUpdates () {
        print("restart here")
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!,
            withHandler: { (accelerometerData, error) -> Void in self.outputAccelerationData(accelerometerData!.acceleration)
                if (error != nil) {
                    print("\(error)")
                    
                }
                
        })
        
    }
    
    
    
    func setupAudioPlayerWithFile(file: String, type: String) -> AVAudioPlayer  {
        
        if let url = NSBundle.mainBundle().URLForResource(file, withExtension: type) {
            do {
                return try AVAudioPlayer(contentsOfURL: url)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        return AVAudioPlayer()
    }
    
    func delay(delay:Double, closure:()->()) {
        
        dispatch_after(
            dispatch_time( DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    
    
    func outputAccelerationData(acceleration: CMAcceleration) {
        
        if (acceleration.z < -0.80) {
            print("Z is here.")
            self.performSegueWithIdentifier("threeToFour", sender: self)
            stopAccelerometerUpdates()
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func stopAccelerometerUpdates() {
        print("stop accel updates from three")
        
        motionManager.stopAccelerometerUpdates()
        
        
        
    }
    
    
    
    
}

