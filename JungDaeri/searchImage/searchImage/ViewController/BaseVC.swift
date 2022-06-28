//
//  ViewController.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/25.
//

import UIKit

class BaseVC: UIViewController {
    var vcTitle:String = ""{
        didSet{
            print("UserListVC: \(vcTitle)")
            self.title = vcTitle
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(showErrorPopup(notification:)), name: Notification.Name(NOTIFICATION.API.AUTH_FAIL), object: nil)
    }
    
    @objc func showErrorPopup(notification: NSNotification){
        print("BaseVC - showErrorPopup")
        if let data = notification.userInfo?["statusCode"]{
            // 메인쓰레드에서 돌리기 UI스레드
            DispatchQueue.main.async {
                self.view
                    .makeToast("error \(data)", duration: 1.0, position: .center)
            }
        }
        
    }

}

