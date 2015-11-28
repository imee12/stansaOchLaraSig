//
//  CuatroViewController.swift
//  bonkNLearn
//
//  Created by Imee Cuison on 11/26/15.
//  Copyright © 2015 Dynepic Inc. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation

class CuatroViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    var cuatro = AVAudioPlayer()
    
    override func viewDidLoad() {
        print("Cuatro is here")
        motionManager.accelerometerUpdateInterval = 0.2
        cuatro = self.setupAudioPlayerWithFile("Cuatro", type:"mp3")
        
        
        cuatro.play()
        delay(1){
            self.cuatro.stop()
        }
        
        
        
        delay(3) {
            self.restartAccelUpdates()
        }
        
        
        super.viewDidLoad()
        
        
        
        
        
        // Do any additional setup after loading the view.
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
            print("cuatro to cinco.")
            self.performSegueWithIdentifier("cuatroToCinco", sender: self)
            stopAccelerometerUpdates()
            
            
            
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func stopAccelerometerUpdates() {
        print("stop accel updates from Cuatro")
        
        motionManager.stopAccelerometerUpdates()
        
        
        
    }
    
    
}
