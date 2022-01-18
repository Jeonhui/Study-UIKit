//
//  ViewController.swift
//  ch19 PinchImage
//
//  Created by 이전희 on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgPinch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)

    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        if pinch.state == UIPinchGestureRecognizer.State.ended{
            imgPinch.transform = CGAffineTransform.identity
        }else{
            imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
            pinch.scale = 1
        }
    }

}

