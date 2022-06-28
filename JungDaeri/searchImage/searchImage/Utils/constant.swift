//
//  constant.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/25.
//

import Foundation

enum SEGUE_ID{
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}
enum API{
    static let BASE_URL : String = "https://api.unsplash.com/"
    
    static let CLIENT_ID : String = "nWKsWFPhH7zzR_yt-REyzjn0oof-1IyTpRIcfYvSv7k"
    
    
}

enum NOTIFICATION{
    enum API{
        static let AUTH_FAIL = "authnotification_fail"
        
    }
}
