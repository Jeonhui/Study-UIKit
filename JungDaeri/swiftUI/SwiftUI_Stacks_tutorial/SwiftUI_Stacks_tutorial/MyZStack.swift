//
//  MyZStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct MyZStack: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 200, height: 200)
                .foregroundColor(.yellow)
                .zIndex(1)
            
            Rectangle()
                .frame(width:100,height: 100)
                .foregroundColor(.red)
                .zIndex(2)
            
            Rectangle()
                .frame(width:50,height: 50)
                .foregroundColor(.blue)
                .zIndex(3)
        }
        .background(.green)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct MyZStack_Previews: PreviewProvider {
    static var previews: some View {
        MyZStack()
    }
}
