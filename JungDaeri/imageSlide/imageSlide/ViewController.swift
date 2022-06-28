//
//  ViewController.swift
//  imageSlide
//
//  Created by 이전희 on 2022/06/24.
//

import UIKit
import FSPagerView

class ViewController: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg"]
    
    @IBOutlet var myPagerView: FSPagerView!{
        didSet {
            // 페이저뷰에 셀을 등록
            self.myPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            // 아이템 크기 설정
            self.myPagerView.itemSize = CGSize(width: 200, height: 180)
            // 무한 스크롤 설정
            self.myPagerView.isInfinite = true
            // 자동 스크롤
            myPagerView.automaticSlidingInterval = 4.0
        }
    }
    
    @IBOutlet var myPageControl: FSPageControl!{
        didSet{
            self.myPageControl.numberOfPages = self.imageNames.count
            self.myPageControl.contentHorizontalAlignment = .right
            self.myPageControl.itemSpacing = 16
            self.myPageControl.interitemSpacing = 16
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPagerView.dataSource = self
        self.myPagerView.delegate = self
    }
    
    
    //MARK: - FSPagerVIew DagtaSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    // 각 셀에 대한 설정
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: imageNames[index])
        cell.textLabel?.text = imageNames[index]
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    //MARK - IBAction
    
    @IBAction func left(_ sender: UIButton) {
        print(self.myPageControl.currentPage)
        if (self.myPageControl.currentPage == 0){
            self.myPageControl.currentPage = self.imageNames.count - 1
        }else{
            self.myPageControl.currentPage = self.myPageControl.currentPage - 1
        }
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
        
    }
    @IBAction func right(_ sender: UIButton) {
        if (self.myPageControl.currentPage == self.imageNames.count - 1){
            self.myPageControl.currentPage = 0
        }else{
            self.myPageControl.currentPage = self.myPageControl.currentPage + 1
        }
        self.myPagerView.scrollToItem(at: self.myPageControl.currentPage, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.myPageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.myPageControl.currentPage = pagerView.currentIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, shouldHighlightItemAt index: Int) -> Bool {
        return false
    }
    
    
}

