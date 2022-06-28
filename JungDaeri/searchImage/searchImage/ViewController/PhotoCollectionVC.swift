//
//  ViewController.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/25.
//

import UIKit

class PhotoCollectionVC: UIViewController, UITextFieldDelegate {
    var vcTitle:String = ""{
        didSet{
            print("UserListVC: \(vcTitle)")
            self.title = vcTitle
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PhotoCollectionVC - viewDidLoad()")
    }
    
}

