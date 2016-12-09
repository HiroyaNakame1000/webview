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
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
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
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (request.url?.scheme == "pageloaded") {
            return false
        }
        return true
    }
    func webViewDidStartLoad(_ webView: UIWebView){
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
         UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
     //---------UIWebViewDelegateメソッド 終わり---------------------------
    

}

