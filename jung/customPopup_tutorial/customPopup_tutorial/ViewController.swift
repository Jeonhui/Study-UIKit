//
//  ViewController.swift
//  customPopup_tutorial
//
//  Created by 이전희 on 2022/06/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var createPopUpBtn: UIButton!
    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCreatePopUpBtnClicked(_ sender: UIButton) {
        print("onCreatePopUpBtn")
        // 스토리보드 가져오기
        let storyboard = UIStoryboard.init(name: "PopUp", bundle: nil)
        //스토리보드를 통해 뷰컨트롤러 가져오기
        let customPopVC = storyboard.instantiateViewController(withIdentifier: "AlertPopupVc") as! CustomPopUpViewController
        //팝업효과 설정
        //뷰 컨트롤러가 보여지는 스타일
        customPopVC.modalPresentationStyle = .overCurrentContext
        // 뷰 컨트롤러가 사라지는 스타일
        customPopVC.modalTransitionStyle = .crossDissolve
        
        customPopVC.moveBtnCompletionClosure = {
            print("호출됨")
            let myChannelUrl = URL(string: "www.google.com")
            self.myWebView.load(URLRequest(url: myChannelUrl!))
        }
        
        self.present(customPopVC, animated: true,completion: nil)
    }
    
}

