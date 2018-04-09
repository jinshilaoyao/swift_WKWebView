//
//  YYWKWebViewController.swift
//  swift_WKWeb
//
//  Created by yaoyao on 2018/4/9.
//  Copyright © 2018年 cn.com.sina.licaishi.client. All rights reserved.
//

import UIKit
import WebKit
class YYWKWebViewController: UIViewController,WKUIDelegate,WKNavigationDelegate {

    var urlString: String = ""
    
    private lazy var wkWebView: WKWebView = { () -> WKWebView in
        let tempWebView = WKWebView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height), configuration: self.config)
        tempWebView.navigationDelegate = self
        tempWebView.uiDelegate = self
        
        tempWebView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        tempWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        return tempWebView;
    }()
    
    private lazy var config: WKWebViewConfiguration = {
       let config = WKWebViewConfiguration()
        config.selectionGranularity = .dynamic
        config.allowsInlineMediaPlayback = true
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        preferences.javaScriptCanOpenWindowsAutomatically = true
        config.preferences = preferences
        return config
    }()
    
    private weak var progressLayer : CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: URL(string: urlString)!)
        wkWebView .load(request)
    }
    deinit {
        wkWebView.removeObserver(self, forKeyPath: "title")
        wkWebView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    private func setupProgress() {
        let progress = UIView()
        progress.frame = CGRect(x: 0, y: 0, width: 375, height: 3)
        progress.backgroundColor = UIColor.clear
        self.view.addSubview(progress)
        
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 0, height: 3)
        layer.backgroundColor = UIColor.green.cgColor
        self.progressLayer = layer
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }

}
extension YYWKWebViewController {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
}
