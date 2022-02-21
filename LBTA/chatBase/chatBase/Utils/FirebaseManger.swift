//
//  FirebaseManger.swift
//  chatBase
//
//  Created by 이전희 on 2022/01/27.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class FirebaseManager : NSObject{
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init(){
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        super.init()
    }
}
