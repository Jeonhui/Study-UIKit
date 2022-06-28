//
//  AlamofireManager.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/27.
//

import Foundation
import Alamofire

final class AlamofireManager{
    // 싱글턴 적용
    static let shared = AlamofireManager()
    
    // 인터셉터 (공통 파라미터)
    let interceptors = Interceptor(interceptors:[BaseIntercetors()])
    
    // 로거 설정
    let monitors = [logger()] as [EventMonitor]
    
    
    // 세션 설정
    var session: Session
    
    private init(){
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
    
}
