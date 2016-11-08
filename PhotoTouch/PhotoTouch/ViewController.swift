//
//  ViewController.swift
//  PhotoTouch
//
//  Created by Kalitha H N on 04/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    var  soundID : SystemSoundID = 0
    //to create an action when button is pressed
    @IBAction func addButtonPressed(sender: AnyObject) {
        //creating obj of UIImagePickerController
        let imagePicker = UIImagePickerController()
        //using delegates in view controller(delegates are the actions)
        imagePicker.delegate = self
        //moves to photo library
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let filePath = NSBundle.mainBundle().pathForResource("beep19", ofType: "mp3")
        let soundURL = NSURL(fileURLWithPath: filePath!)
        
        
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        
           }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func panGestureRecognized(gestureRecognizer:UIPanGestureRecognizer){
       // AudioServicesPlaySystemSound(self.soundID)
        let newPoint : CGPoint = gestureRecognizer.locationInView(self.view)
        self.view.bringSubviewToFront(gestureRecognizer.view!)
        gestureRecognizer.view?.center = newPoint
        
        
    }
    
    func tapGestureRecognized(gestureRecognizer:UITapGestureRecognizer){
        self.view.bringSubviewToFront(self.view)

        UIView.animateWithDuration(0.2, animations: {
            gestureRecognizer.view?.bounds = CGRectMake(0, 0, 200, 200)
            }, completion: { (value: Bool) in
                UIView.animateWithDuration(0.2, animations: {
                    gestureRecognizer.view?.bounds=CGRectMake(0, 0, 110, 110)
                })
        
        })
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
       // var image=UIImage()
        let image=(info[UIImagePickerControllerOriginalImage] as? UIImage)!
        
        let newImageView = UIImageView()
        newImageView.image = image
        newImageView.userInteractionEnabled = true
        self .dismissViewControllerAnimated(true, completion: {
            AudioServicesPlaySystemSound(self.soundID)
            newImageView.frame = CGRectMake(0,0, 110, 110)
            self.view.addSubview(newImageView)
            
            UIView.animateWithDuration(0.3, animations: {
                newImageView.frame = CGRectMake(CGFloat(arc4random_uniform(300)) ,CGFloat(arc4random_uniform(200)), 110, 110)  }) })

            let panGestureRecognizer = UIPanGestureRecognizer(target:self, action:#selector(panGestureRecognized(_:)))
        newImageView.addGestureRecognizer(panGestureRecognizer)
        
        let tapGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized(_:)))
        newImageView.addGestureRecognizer(tapGestureRecognizer)

    
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self .dismissViewControllerAnimated(true, completion: nil)
    }
}

