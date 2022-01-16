//
//  ViewController.swift
//  ch10 tab
//
//  Created by 이전희 on 2022/01/15.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMOoeImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDateView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    

}

