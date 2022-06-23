//
//  MyHStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct MyHStack: View {
    var body: some View {
        HStack(alignment: .center){
            //Divider()
            Image(systemName: "flame.fill")
                .foregroundColor(.red)
                .font(.system(size: 70))
                .padding()
            
            Rectangle()
                .frame(width:100,height: 100)
                .foregroundColor(.yellow)
            Rectangle()
                .frame(width:100,height: 100)
                .foregroundColor(.blue)
            
        }
        .background(.green)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct MyHStack_Previews: PreviewProvider {
    static var previews: some View {
        MyHStack()
    }
}
//
//  MyHStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import Foundation
