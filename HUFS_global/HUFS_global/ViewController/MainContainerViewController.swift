//
//  MainViewController.swift
//  HUFS_global
//
//  Created by 이전희 on 2022/06/25.
//

import UIKit

class MainContainerViewController: UIViewController {
    
    @IBOutlet var verticalStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureStackView()
    }
    
    
    private func configureStackView() {
        for _ in 0..<10 {
            let dummyView = randomColoredView()
            verticalStackView.addArrangedSubview(dummyView)
        }
    }
    
    // 랜덤 색상, 100~400 height를 가진 뷰 생성 함수
    private func randomColoredView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(
            displayP3Red: 1.0,
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: .random(in: 0...1))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: .random(in: 100...400)).isActive = true
        return view
    }
    
}

