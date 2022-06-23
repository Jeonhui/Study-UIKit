//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 이전희 on 2022/06/21.
//

import SwiftUI

struct ContentView: View {
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    MyVStack(isActivated: $isActivated)
                    MyVStack(isActivated: $isActivated)
                    MyVStack(isActivated: $isActivated)
                    MyVStack(isActivated: $isActivated)
                }
                .padding(isActivated ? 50 : 30)
                .background(isActivated ? Color.yellow : Color.black)
                .onTapGesture {
                    // 애니메이션과 함께
                    withAnimation{
                        self.isActivated.toggle()
                    }
                }//HStack
                
                NavigationLink {
                    MyTextView(isActivated: $isActivated)
                } label: {
                    Text("네비게이션 버튼")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .padding()
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }.padding(.top,50)
            }//VStack
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
