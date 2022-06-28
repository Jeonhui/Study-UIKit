//
//  ViewController.swift
//  10 Tab
//
//  Created by 이전희 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDateView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
}

