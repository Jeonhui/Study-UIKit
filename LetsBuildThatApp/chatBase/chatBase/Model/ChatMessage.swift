//
//  ChatMessage.swift
//  chatBase
//
//  Created by 이전희 on 2022/02/05.
//

import Foundation
import FirebaseFirestoreSwift

struct ChatMessage: Codable, Identifiable {
    
    @DocumentID var id: String?
    let fromID, toID, text:String
    let timestamp: Date
    
//    init(documentID: String, data: [String: Any]){
//        self.documentID = documentID
//        self.fromID = data[FirebaseConstants.fromID] as? String ?? ""
//        self.toID = data[FirebaseConstants.toID] as? String ?? ""
//        self.text = data[FirebaseConstants.text] as? String ?? ""
//    }
}
