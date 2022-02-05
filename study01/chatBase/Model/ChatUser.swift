//
//  ChatUser.swift
//  chatBase
//
//  Created by 이전희 on 2022/01/29.
//

import Foundation

struct ChatUser: Identifiable {
    
    var id: String { uid }
    
    let uid, email, profileImageUrl: String
    
    var username: String {
        email.components(separatedBy: "@").first ?? email
    }
    
    init(data: [String: Any]){
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
}
