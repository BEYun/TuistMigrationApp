//
//  DallaNetworkConfig.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import Alamofire

enum DallaNetworkConfig {
    case rqBannerList
}

extension DallaNetworkConfig {
    var url: String {
        switch self {
        case .rqBannerList:
            return DallaNetworkConfig.makeDallaURL("/RqBannerList")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .rqBannerList:
            return HTTPMethod.get
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .rqBannerList:
            return ["Content-Type": "application/json"]
        }
    }
    
    static func makeDallaURL(_ endpoint: String) -> String {
        let url = "http://61.80.148.23:3000\(endpoint)"
        
        return url
    }
}
