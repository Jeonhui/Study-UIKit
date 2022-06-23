//
//  MyVStack.swift
//  SwiftUI_tutorial_#1
//
//  Created by 이전희 on 2022/06/21.
//

import SwiftUI

struct MyVStack:View{
    // 데이터를 연동시킨다
    @Binding
    var isActivated:Bool
    
    //바인딩하려면 생성자
    //.constant(true) 기본값 지정
    init(isActivated: Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    var body: some View{
        VStack{Text("#1")
                .fontWeight(.bold)
                .font(.largeTitle)
            Text("#2")
                .fontWeight(.bold)
                .font(.largeTitle)
            Text("#3")
                .fontWeight(.bold)
                .font(.largeTitle)
        }.background(self.isActivated ? Color.blue : Color.red)
    }
}
struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
