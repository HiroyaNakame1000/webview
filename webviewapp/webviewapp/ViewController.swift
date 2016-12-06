//
//  ViewController.swift
//  webviewapp
//
//  Created by nakamehiroya on 2016/12/05.
//  Copyright © 2016年 nakamehiroya. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate{
    
    @IBOutlet weak var mainWebView: UIWebView!

    var urlString:String = "https://google.com/"
    
    func loadURL() {
        let url = NSURL(string: urlString)
        let urlRequest = NSURLRequest(URL: url!)
        mainWebView.loadRequest(urlRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainWebView.delegate = self
    
        loadURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //---------UIWebViewDelegateメソッド　始まり---------------------------
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (request.URL?.scheme == "pageloaded") {
            return false
        }
        return true
    }
    func webViewDidStartLoad(webView: UIWebView){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
         UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
    }
     //---------UIWebViewDelegateメソッド 終わり---------------------------
    

}

