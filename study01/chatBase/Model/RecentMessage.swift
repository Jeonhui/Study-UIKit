//
//  RecentMessage.swift
//  chatBase
//
//  Created by 이전희 on 2022/02/05.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct RecentMessage: Codable, Identifiable{
    
    //var id: String {documentID}
    
    @DocumentID var id: String?
    
    //let documentID: String
    let text, email: String
    let fromID, toID: String
    let profileImageUrl: String
    let timestamp: Date
    
    var username: String {
        email.components(separatedBy: "@").first ?? email
    }
    
    var timeAgo:String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
    
//    init(documentID: String, data: [String: Any]){
//        self.documentID = documentID
//        self.text = data[FirebaseConstants.text] as? String ?? ""
//        self.fromID = data[FirebaseConstants.fromID] as? String ?? ""
//        self.toID = data[FirebaseConstants.toID] as? String ?? ""
//        self.profileImageUrl = data[FirebaseConstants.profileImageUrl] as? String ?? ""
//        self.email = data[FirebaseConstants.email] as? String ?? ""
//        self.timestamp = data[FirebaseConstants.timestamp] as? Timestamp ?? Timestamp(date: Date())
//    }
    
}
