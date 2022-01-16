//
//  ViewController.swift
//  mission5
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblPageOut: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblPageOut.text = "1"
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        
    }
    @IBAction func ChangePageControl(_ sender: UIPageControl) {
        lblPageOut.text = String(pageControl.currentPage + 1)
    }
    

}

