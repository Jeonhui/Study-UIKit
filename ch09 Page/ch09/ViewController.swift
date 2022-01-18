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
    
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(swipeRightMulti)
    }
    
    @objc func respondToSwipeGesture(_ gesture: UISwipeGestureRecognizer){
        switch gesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage = (pageControl.currentPage+1)
                
            case UISwipeGestureRecognizer.Direction.right:
                pageControl.currentPage = (pageControl.currentPage-1)
            default:
                break
        }
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    @objc func respondToSwipeGestureMulti(_ gesture: UISwipeGestureRecognizer){
        switch gesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                pageControl.currentPage = images.count
                
            case UISwipeGestureRecognizer.Direction.right:
            pageControl.currentPage = 0
            default:
                break
        }
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    @IBAction func pageChange(_ sender: Any) {
        imageView.image = UIImage(named: images[pageControl.currentPage])
    }
    

}

