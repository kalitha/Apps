//
//  ViewController.swift
//  UIWebViewExample
//
//  Created by Kalitha H N on 07/11/16.
//  Copyright © 2016 BridgeLabz Solutions LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "https://www.google.com");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func goBack(sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func reload(sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func cancel(sender: UIButton) {
        webView.stopLoading()
    }
    
    @IBAction func goForward(sender: UIButton) {
        webView.goForward()
    }
    
}

