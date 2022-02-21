//
//  ViewController.swift
//  mission4
//
//  Created by 이전희 on 2022/01/14.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var myWebView: WKWebView!
    
    func loadWebPage(_ url:String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
}

