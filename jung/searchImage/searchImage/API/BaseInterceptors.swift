//
//  BaseInterceptors.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/27.
//

import Foundation
import Alamofire
import UniformTypeIdentifiers

class BaseIntercetors: RequestInterceptor{
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("BaseIntercetors - adapt")
        var request = urlRequest
        request.addValue("application/json; charet=UTF-8", forHTTPHeaderField: "Content-type")
        request.addValue("application/json; charet=UTF-8", forHTTPHeaderField: "Accept")
        
        // 공통 파라미터 추가
        var dictionary = [String:String]()
        dictionary.updateValue(API.CLIENT_ID, forKey: "client_id")
        
        do{
            request = try URLEncodedFormParameterEncoder().encode(dictionary, into: request)
        }catch{
            print(error)
        }
        print("BaseIntercetors - adapt request :",request)
        completion(.success(request))
    }
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        print("BaseIntercetors - retry")
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        let data = ["statusCode": statusCode]
        
        NotificationCenter.default.post(name: NSNotification.Name(NOTIFICATION.API.AUTH_FAIL), object: nil, userInfo: data)
        completion(.doNotRetry)
    }
}
