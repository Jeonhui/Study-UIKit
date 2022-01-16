//
//  ViewController.swift
//  ch09
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit
var images = ["01.png","02.png","03.png","04.png","05.png","06.png"]

class ViewController: UIViewController {
    

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        imageView.image = UIImage(named: images[0])
    
        
    }
    @IBAction func pageChange(_ sender: Any) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    

}

