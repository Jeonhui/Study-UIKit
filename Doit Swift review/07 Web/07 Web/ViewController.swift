//
//  ViewController.swift
//  07 Web
//
//  Created by 이전희 on 2022/05/18.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://www.google.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String)->String{
        var strUrl = url
        if !strUrl.hasPrefix("http://"){
            strUrl = "http://" + url
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoGoogle(_ sender: UIButton) {
        loadWebPage("http://www.google.com")
    }
    @IBAction func btnGoNaver(_ sender: UIButton) {
        loadWebPage("http://www.naver.com")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1>HTML String</h1><p>this is HTML String Load</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlFile", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url:myUrl)
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

