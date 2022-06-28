//
//  logger.swift
//  searchImage
//
//  Created by 이전희 on 2022/06/27.
//

import Foundation
import Alamofire

final class logger: EventMonitor{
    let queue = DispatchQueue(label: "APILog")
    
    func requestDidResume(_ request: Request) {
        print("logger - requestDidResume")
        debugPrint(request) // HomeVC
    }
    
    func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
        
        print("logger - request statusCode: \(statusCode)")
    }
}
