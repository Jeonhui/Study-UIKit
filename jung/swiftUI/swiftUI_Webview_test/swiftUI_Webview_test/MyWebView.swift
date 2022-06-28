//
//  MyWebView.swift
//  swiftUI_Webview_test
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI
import WebKit

// uikit의 uiview를 사용할 수 있도록 한다.
// UIViewControllerRepresentable

struct MyWebview: UIViewRepresentable{
    var urlToLoad: String = "www.naver.com"
    
    // ui view 만들기
    func makeUIView(context: Context) -> some WKWebView {
        guard let url = URL(string: self.urlToLoad) else{
            return WKWebView()
        }
        // 웹뷰 인스턴스 생성
        let webview = WKWebView()
        // 웹뷰를 로드한다.
        webview.load(URLRequest(url: url))
        //웹뷰를 반환
        return webview
    }
    
    // update ui view
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<MyWebview>) {
    }
    
}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview()
    }
}
