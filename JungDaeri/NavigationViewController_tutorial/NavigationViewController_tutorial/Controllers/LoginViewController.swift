//
//  ViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 이전희 on 2022/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginBtn: UIButton!
    
    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //상단 네비게이션 바 부분을 숨김처리한다.
        self.navigationController?.isNavigationBarHidden = true
        
        loginBtn.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)
    }
    
    //메인 화면으로 이동
    @objc fileprivate func moveToMainViewController(){
        print("LoginViewController - moveToMainViewController")
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }


}

