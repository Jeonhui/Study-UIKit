//
//  ViewController.swift
//  web
//
//  Created by 이전희 on 2022/01/14.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var txtURL: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url:myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        loadWebPage("https://github.com/Jeonhui")
    }
    
    func webView(_ webView:WKWebView, didCommit Navigation: WKNavigation!){
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden=true
    }
    
    func checkUrl(_ url: String)-> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("https://")
        if !flag{
            strUrl = "https://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoURL(_ sender: UIButton) {
        let myUrl = checkUrl(txtURL.text!)
        txtURL.text=""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://www.google.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://jeonhui.github.io/portfolio")
    }
    @IBAction func btnLoadHTMLString(_ sender: UIButton) {
        let htmlString = "<h1>Hi, I'm Jeonhui</h1><a href='https://jeonhui.github.io/portfolio'>github</a>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHTMLFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    

}

