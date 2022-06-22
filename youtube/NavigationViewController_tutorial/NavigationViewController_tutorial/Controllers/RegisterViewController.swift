//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 이전희 on 2022/06/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("onLoginViewControllerBtnClicked")
        // 네비게이션뷰
        
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    

}
