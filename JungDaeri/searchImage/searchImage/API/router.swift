//
//  router.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/27.
//

import Foundation
import Alamofire

// 검색관련 api 호출
enum router: URLRequestConvertible {
    
    case searchPhotos(term: String)
    case serchUsers(term:String)
    
    var baseURL: URL { // closure 밑에서 나온 값이 이 변수다.
        return URL(string: API.BASE_URL + "search/")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var endPoint: String {
        switch self {
        case .searchPhotos: return "photos/"
        case .serchUsers: return "users/"
        }
    }
    
    var parameters : [String:String]{
        switch self {
        case let .serchUsers(term), let .searchPhotos(term):
            return ["query": term]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method

        request = try URLEncodedFormParameterEncoder().encode(parameters,into:request)
        
//        switch self {
//        case let .searchPhotos(parameters):
//            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
//        case let .serchUsers(parameters):
//            request = try JSONParameterEncoder().encode(parameters, into: request)
//        }
        
        return request
    }
}
