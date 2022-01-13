//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이전희 on 2022/01/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel!
    @IBOutlet var lblSwift: UILabel!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text = "Hello, "+txtName.text!+"!"
    }
    
}

