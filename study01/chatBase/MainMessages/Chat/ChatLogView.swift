//
//  ChatLogView.swift
//  chatBase
//
//  Created by 이전희 on 2022/02/03.
//

import SwiftUI

struct ChatLogView: View {
    
    let chatUser: ChatUser?
    
    @State var chatText = ""
    
    var body: some View{
        messagesView
//        ZStack{
//
//            VStack(spacing:0){
//                Spacer()
//                chatBottomBar
//                    .background(Color.white)
//            }
//        }
        .navigationTitle(chatUser?.email ?? "")
        .navigationBarTitleDisplayMode(.inline) //Title 위 쪽에 넣기
        
    }
    private var messagesView: some View{
        ScrollView{
            ForEach(0..<20){ num in
                HStack{
                    Spacer()
                    HStack{
                        Text("FAKE MESSAGE FOR NOW")
                            .foregroundColor(.white)
                        
                    }.padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top,8)
            }
            HStack{Spacer()}
        }.background(Color(.init(white: 0.95, alpha: 1)))
            .safeAreaInset(edge: .bottom) {
                chatBottomBar
            }
    }
    
    private var chatBottomBar: some View{
        HStack(spacing: 16){
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 24))
                .foregroundColor(Color(.darkGray))
            //TextEditor(text: $chatText)
            TextField("Description", text: $chatText)
            Button {
                
            } label: {
                Text("Send")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.vertical,8)
            .background(Color.blue)
            .cornerRadius(4)
        }
        .padding(.horizontal)
        .padding(.vertical,8)
    }
}


struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChatLogView(chatUser: .init(data:["uid":"3OUZ8IGHyKhWKs2Tn9YRHdFlcL23","email":"dlwjsgml02@naver.com","profileImageUrl":"https://firebasestorage.googleapis.com:443/v0/b/chattest-b3068.appspot.com/o/3OUZ8IGHyKhWKs2Tn9YRHdFlcL23?alt=media&token=6bd3c9aa-6ca5-4577-8ab0-1c57c2c39f86"]))
        }
    }
}
