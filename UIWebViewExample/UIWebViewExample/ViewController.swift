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
        let url = URL (string: "https://www.google.com");
        let requestObj = URLRequest(url: url!);
        webView.loadRequest(requestObj);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func goBack(_ sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func reload(_ sender: UIButton) {
        webView.reload()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        webView.stopLoading()
    }
    
    @IBAction func goForward(_ sender: UIButton) {
        webView.goForward()
    }
    
}

