//
//  MyVStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct MyVStack: View {
    var body: some View {
        VStack(alignment:.trailing ,spacing:0){
            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
        
            Divider().opacity(0) // 전부 정렬
            Rectangle()
                .frame(width: 100,height: 100)
                .foregroundColor(Color.red)
            Rectangle()
                .frame(width: 100,height: 100)
                .foregroundColor(Color.yellow)
            Spacer()
                .frame(height:50)
            Rectangle()
                .frame(width: 100,height: 100)
                .foregroundColor(Color.blue)
//            Spacer()
//            Spacer()
//            Spacer()
        }
        .frame(width: 300)
        .background(.green)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
//
//  MyVStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import Foundation
