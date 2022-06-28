//
//  ContentView.swift
//  Image_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct ContentView: View {
    @State
    private var isActivated:Bool = false
    
    var body: some View {
        NavigationView{
            withAnimation {
                VStack{
                    CircleImageView(isActivated: $isActivated)
                    .onTapGesture {
                        withAnimation {
                            isActivated.toggle()
                        }
                    }
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
