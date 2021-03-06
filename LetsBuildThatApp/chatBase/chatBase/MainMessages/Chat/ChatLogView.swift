//
//  ChatLogView.swift
//  chatBase
//
//  Created by 이전희 on 2022/02/03.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class ChatLogViewModel: ObservableObject{
    
    @Published var chatText = ""
    @Published var errorMessage = ""
    
    @Published var chatMessges = [ChatMessage]()
    
    var chatUser: ChatUser?
    
    init(chatUser: ChatUser?){
        self.chatUser = chatUser
        fetchMessages()
    }
    
    var firestoreListener: ListenerRegistration?
    
    func fetchMessages(){
        guard let fromID = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toID = chatUser?.uid else { return }
        
        firestoreListener?.remove()
        chatMessges.removeAll()
        
        firestoreListener = FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromID)
            .collection(toID)
            .order(by: "timestamp")
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    self.errorMessage = "Failed to listen for messages:\(error)"
                    print(error)
                    return
                }
                
                querySnapshot?.documentChanges.forEach({
                    change in
                    if change.type == .added{
                        if let data = try? change.document.data(as: ChatMessage.self){
                            self.chatMessges.append(data)
                        }
                    }
                })
                
                //                querySnapshot?.documents.forEach({
                //                    queryDocumentSnapshot in
                //                    let data = queryDocumentSnapshot.data()
                //                    let docID = queryDocumentSnapshot.documentID
                //                    self.chatMessges.append(.init(documentID: docID, data: data))
                //                })
                
                DispatchQueue.main.async {
                    self.count += 1
                }
                
            }
    
    }
    
    func handleSend(){
        guard let fromID = FirebaseManager.shared.auth.currentUser?.uid else { return }
        guard let toID = chatUser?.uid else { return }
        
        let document = FirebaseManager.shared.firestore
            .collection("messages")
            .document(fromID)
            .collection(toID)
            .document()
        
        let messageData = [FirebaseConstants.fromID:fromID, FirebaseConstants.toID:toID, FirebaseConstants.text: self.chatText, FirebaseConstants.timestamp: Timestamp()]  as [String : Any]
        
        document.setData(messageData){error in
            if let error = error{
                self.errorMessage = "Faild to save message into Firestore: \(error)"
            }
            print("Successfully saved current user sending message")
            
            
            self.persistRecentMessage()
            
            self.chatText = ""
            self.count += 1
        }
        
        let recipientMessageDocument = FirebaseManager.shared.firestore
            .collection("messages")
            .document(toID)
            .collection(fromID)
            .document()
        
        recipientMessageDocument.setData(messageData){error in
            if let error = error{
                self.errorMessage = "Faild to save message into Firestore: \(error)"
            }
            print("Recipient saved message as well")
        }
        
        
    }
    
    private func persistRecentMessage(){
        
        guard let chatUser = chatUser else { return }
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        guard let toID = self.chatUser?.uid else{ return }
        
        let document = FirebaseManager.shared.firestore
            .collection("recent_messages")
            .document(uid)
            .collection("messages")
            .document(toID)
        
        let data = [
            FirebaseConstants.timestamp:Timestamp(),
            FirebaseConstants.text:self.chatText,
            FirebaseConstants.fromID:uid,
            FirebaseConstants.toID : toID,
            FirebaseConstants.profileImageUrl : chatUser.profileImageUrl,
            FirebaseConstants.email: chatUser.email
        ] as [String : Any]
        
        //you'll need to save another very similar dictionary for the recipient of this message ... how?
        
        document.setData(data){ error in
            if let error = error {
                self.errorMessage = "Failed to save recent message: \(error)"
                print("Failed to save recent message: \(error)")
                return
            }
        }
    }
    
    @Published var count = 0
    
}

struct ChatLogView: View {
    
//    let chatUser: ChatUser?
//
//    init(chatUser: ChatUser?){
//        self.chatUser = chatUser
//        self.vm = ChatLogViewModel(chatUser: chatUser)
//    }
    
    @ObservedObject var vm:ChatLogViewModel
    
    var body: some View{
        ZStack{
            messagesView
            Text(vm.errorMessage)
        }
        .navigationTitle(vm.chatUser?.email ?? "")
        .navigationBarTitleDisplayMode(.inline) //Title 위 쪽에 넣기
        .onDisappear {
            vm.firestoreListener?.remove()
        }
//        .navigationBarItems(trailing: Button(action: {
//            vm.count += 1
//        }, label: {
//            Text("Count: \(vm.count)")
//        }))
    }
    
    static let emptyScrollToString = "Empty"
    
    private var messagesView: some View {
        VStack{
            if #available(iOS 15.0, *){
                ScrollView{
                    ScrollViewReader {scrollViewProxy in
                        VStack{
                            ForEach(vm.chatMessges){message in
                                MessageView(message:message)
                            }
                            HStack{Spacer()}
                            .id(Self.emptyScrollToString)
                        }.onReceive(vm.$count) { _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                scrollViewProxy.scrollTo("Empty", anchor: .bottom)
                            }
                        }
                    }
                    
                }.background(Color(.init(white: 0.95, alpha: 1)))
                    .safeAreaInset(edge: .bottom) {
                        chatBottomBar
                            .background(Color(.systemBackground).ignoresSafeArea())
                    }
            } else {
                
            }
            
        }
    }
    
    private var chatBottomBar: some View{
        HStack(spacing: 16){
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 24))
                .foregroundColor(Color(.darkGray))
            ZStack{
                DescriptionPlaceholder()
                TextEditor(text: $vm.chatText)
                    .opacity(vm.chatText.isEmpty ? 0.5 : 1)
            }
            .frame(height:40)
            //TextField("Description", text: $chatText)
            
            Button {
                vm.handleSend()
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

struct MessageView: View {
    
    let message:ChatMessage
    
    var body: some View {
        VStack{
            if message.fromID == FirebaseManager.shared.auth.currentUser?.uid{
                HStack{
                    Spacer()
                    HStack{
                        Text(message.text)
                            .foregroundColor(.white)
                        
                    }.padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            } else {
                HStack{
                    HStack{
                        Text(message.text)
                            .foregroundColor(.blue)
                        
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(8)
                    Spacer()
                }
                
            }
        }.padding(.horizontal)
            .padding(.top,8)
    }
}

private struct DescriptionPlaceholder: View{
    var body: some View{
        HStack{
            Text("Description")
                .foregroundColor(Color(.gray))
                .font(.system(size: 17))
                .padding(.leading,5)
                .padding(.top,-4)
            Spacer()
        }
    }
}

struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
//        NavigationView{
//            ChatLogView(chatUser: .init(data:["uid":"3OUZ8IGHyKhWKs2Tn9YRHdFlcL23","email":"dlwjsgml02@naver.com","profileImageUrl":"https://firebasestorage.googleapis.com:443/v0/b/chattest-b3068.appspot.com/o/3OUZ8IGHyKhWKs2Tn9YRHdFlcL23?alt=media&token=6bd3c9aa-6ca5-4577-8ab0-1c57c2c39f86"]))
//        }
    }
}
