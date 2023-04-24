//
//  NetworkConfig.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import Alamofire

// 네트워크 URL과 Parameter, Headers를 가지는 클래스
class NetworkConfig {
    let url: String
    let method: HTTPMethod
    let parameter: [String: Any]?
    let headers: HTTPHeaders
    
    init(url: String, method: HTTPMethod, headers: HTTPHeaders) {
        self.url = url
        self.method = method
        self.parameter = nil
        self.headers = headers
    }
}
