//
//  ViewController.swift
//  ch19 PinchGesture
//
//  Created by 이전희 on 2022/01/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtPinch: UILabel!
    
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        if pinch.state == UIPinchGestureRecognizer.State.began{
            initialFontSize = txtPinch.font.pointSize
        }else{
            txtPinch.font = txtPinch.font.withSize(initialFontSize*pinch.scale)
        }
    }


}

