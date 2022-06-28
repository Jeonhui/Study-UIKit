//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 이전희 on 2022/06/21.
//

import UIKit

class MainViewController: UIViewController {
    var isBgOrange: Bool = true
    
    //제목
    var titleLabel: UILabel = {
        let label = UILabel() //인스턴스 생성
        label.text = "메인 화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = UIColor.white
        return label
    }()
    
    let changeBtn:UIButton = {
        let btn = UIButton(type:.system)
        btn.setTitle("배경색 바꾸기", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 5
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 50, bottom: 10, trailing: 50)
        btn.configuration = config
        
        btn.addTarget(self,action: #selector(changeBG), for: .touchUpInside)
        
        return btn
    }()
    
   
    
    //뷰가 생성되었을때
    override func viewDidLoad(){
        view.backgroundColor = UIColor.orange
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeBtn)
        changeBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
    }
    
    @objc fileprivate func changeBG(){
        if isBgOrange == true{
            view.backgroundColor = .orange
            isBgOrange = false
        }else{
            view.backgroundColor = .blue
            isBgOrange = true
        }
        print("MainViewController - changeBG() called")
    }
    
}
