//
//  ContentView.swift
//  chatBase
//
//  Created by 이전희 on 2022/01/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    @State var shouldShowImagePicker = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing:16){
                    Picker(selection: $isLoginMode, label: Text("Picker here")){
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode{
                        Button{
                            shouldShowImagePicker
                                .toggle()
                        } label: {
                            VStack{
                                if let image = self.image{
                                    Image(uiImage:image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                }else{
                                    Image(systemName: "person.fill")
                                        .font(.system(size:64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                            .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.black,lineWidth: 3)
                            )
                        }
                    }
                    
                    Group{
                        TextField("Email", text: $email).keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                        
                    }.padding()
                        .background(Color.white)
                    
                    
                    
                    Button{
                        handleAction()
                    }label:{
                        HStack{
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .font(.system(size:14,weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }.padding()
                    Text(self.loginStatusMessage).foregroundColor(self.loginStatusMessage.hasPrefix("Successfully") ? .green : .red)
                }
                .padding()
                
            }
            .navigationTitle(isLoginMode ? "Login":"Create Account")
            .background(Color(.init(white: 0,alpha: 0.05)).ignoresSafeArea())
        }.navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
                ImagePicker(image: $image)
            }
    }
    
    @State var image: UIImage?
    
    
    private func handleAction(){
        if isLoginMode{
            //print("should log into Firebase with existing credentials")
            loginUser()
        }else{
            createNewAccount()
            print("Resister a new account insize of Firebase Auth and then store image in Storage somhow ...")
        }
    }
    private func loginUser(){
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password){
            result, err in
            if let err = err{
                print("Failed to login user: ",err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            print("Successfully logged in user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully logged in user: \(result?.user.uid ?? "")"
        }
    }
    
    
    @State var loginStatusMessage = ""
    
    private func createNewAccount(){
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password){
            result, err in
            if let err = err{
                print("Failed to create user: ",err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            print("Successfully created user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            self.persistImageToStorage()
        }
    }
    private func persistImageToStorage(){
        //let filename = UUID().uuidString
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
        else {return}
        
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5)
        else{return}
        
        ref.putData(imageData, metadata:nil){
            metadata, err in
            if let err = err{
                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
                return
            }
            ref.downloadURL{
                url, err in
                if let err = err{
                    self.loginStatusMessage = "Failed to downloadURL: \(err)"
                    return
                }
                self.loginStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                guard let url = url else { return }
                storeUserInformation(url)
            }
        }
    }
    private func storeUserInformation(_ imageProfileUrl: URL){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else{return}
        let userData = ["email":self.email, "uid":uid,"profileImageUrl":imageProfileUrl.absoluteString]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData){
                err in
                if let err = err{
                    print(err)
                    self.loginStatusMessage="\(err)"
                    return
                }
                print("Success")
            }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
