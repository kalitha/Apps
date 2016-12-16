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

    var  soundID : SystemSoundID = 0 //used to hold the sound
    //to create an action when button is pressed
    @IBAction func addButtonPressed(_ sender: AnyObject) {
        //creating obj of UIImagePickerController
        let imagePicker = UIImagePickerController()
        //using delegates in view controller(delegates are the actions)
        imagePicker.delegate = self
        //source is photo library
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)

    }
    
    //when we drag and put the resources into the project, they are by default included the app's bundle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //used to find path for sound effect
        let filePath = Bundle.main.path(forResource: "beep19", ofType: "mp3")
        let soundURL = URL(fileURLWithPath: filePath!)
        
        //creating sound with c function using AudioServicesCreateSystemSoundID
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        
           }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func panGestureRecognized(_ gestureRecognizer:UIPanGestureRecognizer){
       // AudioServicesPlaySystemSound(self.soundID)
        let newPoint : CGPoint = gestureRecognizer.location(in: self.view)
        //to bring the image that we tapped into front
        self.view.bringSubview(toFront: gestureRecognizer.view!)
        gestureRecognizer.view?.center = newPoint
        
        
    }
    
    func tapGestureRecognized(_ gestureRecognizer:UITapGestureRecognizer){
        self.view.bringSubview(toFront: self.view)
//we set the bounds inorder to change the size of the image view, here the image expans to 200 and 200 in 0.2 seconds
        
        UIView.animate(withDuration: 0.2, animations: {
            gestureRecognizer.view?.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
            }, completion: { (value: Bool) in //code to shrink the image back(i.e inorder to
                UIView.animate(withDuration: 0.2, animations: { //shrink the image back we need
                gestureRecognizer.view?.bounds=CGRect(x: 0, y: 0, width: 110, height: 110)//to write another animateWithDuration method
                })
        
        })
    }
    //gets called when useer picks an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       // var image=UIImage() [we can use 2 steps or only below step is sufficient
        //getting the image
        let image=(info[UIImagePickerControllerOriginalImage] as? UIImage)!
        
    
        //creating an image view
        let newImageView = UIImageView()
        newImageView.image = image
        newImageView.isUserInteractionEnabled = true
        self .dismiss(animated: true, completion: {
            AudioServicesPlaySystemSound(self.soundID)
            newImageView.frame = CGRect(x: 0,y: 0, width: 110, height: 110)
            //adding imageview to the view
            self.view.addSubview(newImageView)
            
            UIView.animate(withDuration: 0.3, animations: {
                //used to set the size and location of the image view
                [newImageView.frame = CGRect(x: CGFloat(arc4random_uniform(300)) ,y: CGFloat(arc4random_uniform(200)), width: 110, height: 110)]
               // [newImageView .alpha : 0.5]
            }) })

            let panGestureRecognizer = UIPanGestureRecognizer(target:self, action:#selector(panGestureRecognized(_:)))
        //adding gesture recogniser
        newImageView.addGestureRecognizer(panGestureRecognizer)
        
        let tapGestureRecognizer=UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognized(_:)))
        newImageView.addGestureRecognizer(tapGestureRecognizer)

    
    }
    
    //gets called when user doesnt pick any image
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self .dismiss(animated: true, completion: nil)//used to dismiss the view controller
    }
}

