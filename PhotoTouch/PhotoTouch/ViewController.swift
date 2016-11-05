//
//  ViewController.swift
//  PhotoTouch
//
//  Created by BridgeLabz on 04/11/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    
    @IBAction func addButtonPressed(sender: AnyObject) {
        //creating obj of UIImagePickerController
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
       // var image=UIImage()
        var image=(info[UIImagePickerControllerOriginalImage] as? UIImage)!
        
        let newImageView = UIImageView()
        newImageView.image = image
        self .dismissViewControllerAnimated(true, completion: {
        
        newImageView.frame = CGRectMake(100,150, 110, 110)
            self.view.addSubview(newImageView);
        UIView.animateWithDuration(0.5, animations: (newImageView.frame=CGRectMake(100, 150, 110, 110)))})
    
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self .dismissViewControllerAnimated(true, completion: nil)
    }
}

