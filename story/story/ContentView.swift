//
//  ContentView.swift
//  story
//
//  Created by 이전희 on 2022/02/01.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ForEach (0..<10,id:\.self){ num in
                        VStack(spacing:16){
                            Text("Hello")
                            
                            Text("Content")
                        }.padding()
                           
                            .border(.gray, width: 1.5)
                            .cornerRadius(30)
                    }
                }.padding()
            }.navigationTitle("Story")
                .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
