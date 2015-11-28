//
//  ElephantViewController.swift
//  bonkNLearn
//
//  Created by Imee Cuison on 11/27/15.
//  Copyright © 2015 Dynepic Inc. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation


class ElephantViewController: UIViewController {
    
    
    var elephant = AVAudioPlayer()
    var dog = AVAudioPlayer()
    var motionManager = CMMotionManager()
    
    
    
    override func viewDidLoad() {
        motionManager.accelerometerUpdateInterval = 0.2
        elephant = self.setupAudioPlayerWithFile("One", type:"mp3")
        dog = self.setupAudioPlayerWithFile("Two", type:"mp3")
        
        
        delay(3) {
            self.restartAccelUpdates()
        }

        
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(3) {
            self.restartAccelUpdates()
        }
        

        
    
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
            
            stopAccelerometerUpdates()
            
            
            let random = Int(arc4random_uniform(UInt32(2)))
            
            //            let random = 2
            switch random
            {
            case 0:
                print("elephant")
                let elephantvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ElephantViewController") as UIViewController
             //   let govc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AnimalGoViewController") as UIViewController
                // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
                appDelegate.window?.rootViewController = elephantvc
                
                
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    // do some task
                    dispatch_async(dispatch_get_main_queue()) {
                        self.presentViewController(elephantvc, animated: false, completion: nil)
                        self.dismissViewControllerAnimated(false, completion: nil)
                    }
                }

                
                
                
                elephant.play()
                delay(1){
                    self.elephant.stop()
                }
                
                
                //                NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(3), target: self, selector: "functionHere", userInfo: nil, repeats: false)
                
                break
                
                
                
                //            case 1:
                //                print("dos")
                //                let dogvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DogViewController") as UIViewController
                //                // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                //                let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
                //                appDelegate.window?.rootViewController = dogvc
                //
                //                self.presentViewController(dogvc, animated: false, completion: nil)
                //
                //
                //                dog.play()
                //
                //
                //                delay(1){
                //                    self.dog.stop()
                //                }
                //
                //
                //                break
                
            default:
                print("Something else")
                let dogvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("DogViewController") as UIViewController
                // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
                let appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
                appDelegate.window?.rootViewController = dogvc
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    // do some task
                    dispatch_async(dispatch_get_main_queue()) {
                        self.presentViewController(dogvc, animated: false, completion: nil)
                        self.dismissViewControllerAnimated(false, completion: nil)
                    }
                }
                

                
            
                
                dog.play()
                
                
                delay(1){
                    self.dog.stop()
                }
                
                
                break
                
                
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func stopAccelerometerUpdates() {
        print("stop accel updates")
        
        motionManager.stopAccelerometerUpdates()
        
        
        //most likely not need this delay keep for now
        //        delay(5){
        //            print("delay working from 3")
        //
        //  }
        
        
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
