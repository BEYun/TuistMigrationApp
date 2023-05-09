//
//  DallaNetworkConfig.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import Alamofire

// case에 따른 networkConfig 생성
enum DallaNetworkConfig {
    case rqBannerList
    case rqMyStarList
    case rqEventBannerList
    case rqRoomList
}

extension DallaNetworkConfig {
    var url: String {
        switch self {
        case .rqBannerList:
            return DallaNetworkConfig.makeDallaURL("/RqBannerList")
        case .rqMyStarList:
            return DallaNetworkConfig.makeDallaURL("/RqMyStarList")
        case .rqEventBannerList:
            return DallaNetworkConfig.makeDallaURL("/RqEventBannerList")
        case .rqRoomList:
            return DallaNetworkConfig.makeDallaURL("/RqRoomList")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .rqBannerList, .rqMyStarList, .rqEventBannerList:
            return HTTPMethod.get
        case .rqRoomList:
            return HTTPMethod.post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    static func makeDallaURL(_ endpoint: String) -> String {
        let url = "http://61.80.148.23:3000\(endpoint)"
        
        return url
    }
}
