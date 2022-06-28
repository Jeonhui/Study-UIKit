//
//  ViewController.swift
//  customPopup_tutorial
//
//  Created by 이전희 on 2022/06/23.
//

import UIKit
import WebKit

//프로토콜 델리게이트 (리모컨)

class ViewController: UIViewController, popupDelegate{

    
    
    @IBOutlet var createPopUpBtn: UIButton!
    @IBOutlet var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadWebPage("https://www.google.com")
        
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
        
        // 비동기식
        customPopVC.moveBtnCompletionClosure = {
            print("호출됨")
            self.loadWebPage("https://www.naver.com")
        }
        
        customPopVC.myPopUpDelegate = self
        
        self.present(customPopVC, animated: true,completion: nil)
    }
    
    private func loadWebPage(_ url: String) {
            guard let myUrl = URL(string: url) else {
                return
            }
            let request = URLRequest(url: myUrl)
            myWebView.load(request)
        }
    //MARK: - Delegate methods
    func onMove2() {
        print("viewController - onMove2")
        loadWebPage("https://www.github.com")
    }
    
}

