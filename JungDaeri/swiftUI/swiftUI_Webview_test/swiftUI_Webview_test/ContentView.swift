//
//  ContentView.swift
//  swiftUI_Webview_test
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.naver.com")
                    .edgesIgnoringSafeArea(.all)) {
                    Text("naver")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .padding(20)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                        
                }
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.google.com")
                    .edgesIgnoringSafeArea(.all)) {
                    Text("google")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .padding(20)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                            
                }
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.github.com")
                    .edgesIgnoringSafeArea(.all)) {
                    Text("github")
                            .fontWeight(.semibold)
                            .font(.system(size: 30))
                            .padding(20)
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                }

            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
