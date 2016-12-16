//
//  ViewController.swift
//  DummyProject
//
//  Created by BridgeLabz Solutions LLP on 29/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
//        didSet{
//            myView.alpha = 1
//        }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        //animateView()
//        let labelObj = UILabel()//creating obj of label class
//        //labelObj.frame = CGRect(x: 40, y: 40, width: 60, height: 30)//setting frames
//        labelObj.alpha = 0.5
//        labelObj.bounds = CGRect(x: 0, y: 0, width: 300, height: 600)
//        labelObj.text = "hello good morning"
//        view.addSubview(labelObj)
//        // Do any additional setup after loading the view, typically from a nib.
        
        myView.alpha = 0
        let scale = CGAffineTransform(scaleX: 0.1, y: 0.1)
        myView.transform = CGAffineTransform(translationX: -100, y: -100)
        //myView.transform = CGAffineTransform(rotationAngle: 90).concatenating(scale)
        
//        UIView.animate(withDuration: 2, delay: 0.2, usingSpringWithDamping: 0.1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
//            self.myView.alpha = 1.0
//            self.myView.transform = CGAffineTransform(translationX: 0, y: 0)
//            //let scale = CGAffineTransform(scaleX: 1, y: 1)
//             //self.myView.transform = CGAffineTransform(rotationAngle: 0).concatenating(scale)
//        }, completion: nil)
        
        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.myView.alpha = 1
            self.myView.transform = CGAffineTransform(translationX: 100, y: 100)
        }, completion: {finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.myView.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
        })
        

        
    }
//    func animateView(){
//        self.myView.alpha = 0
//        UIView.animate(withDuration: 3, animations: {
//            self.myView.alpha = 1
//        })
//    }

}

