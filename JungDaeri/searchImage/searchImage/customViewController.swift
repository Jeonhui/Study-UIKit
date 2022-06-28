//
//  ViewController.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/25.
//

import UIKit

class CusstomViewController: UIViewController {
    
    var isPictureMode: Bool = true
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var sgSelect: UISegmentedControl!
    @IBOutlet var picAndUserSearchBar: UISearchBar!
    
    lazy var accessoryView: UIView = {
        return UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 72.0))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        sgSelect.selectedSegmentIndex = 0
        picAndUserSearchBar.placeholder = "사진 키워드 입력"
        picAndUserSearchBar.inputAccessoryView = accessoryView
    }
    
    @IBAction func selectSgSelect(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            isPictureMode = true
            picAndUserSearchBar.placeholder = "사진 키워드 입력"
        }else{
            isPictureMode = false
            picAndUserSearchBar.placeholder = "사용자 이름 입력"
            
        }
    }

}

