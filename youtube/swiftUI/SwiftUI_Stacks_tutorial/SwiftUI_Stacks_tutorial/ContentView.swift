//
//  ContentView.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("안냥")
            MyVStack()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
