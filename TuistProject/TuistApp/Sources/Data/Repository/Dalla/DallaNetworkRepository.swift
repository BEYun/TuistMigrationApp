//
//  DallaNetworkRepository.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

// MARK: config 프로퍼티를 파라미터로 받은 NetworkServiceAF 클래스의 completion을 Result<JSON, Error> 타입으로 변환 후, completion으로 탈출시킴

class DallaNetworkRepository {
    typealias ResultType = Result<JSON, Error>
    
    let config: NetworkConfig
    let networkServiceAF: NetworkServiceAF
    
    init(config: NetworkConfig) {
        self.config = config
        self.networkServiceAF = NetworkServiceAF(networkConfig: config)
    }
    
    func fetchData(completion: @escaping (JSON) -> Void) {
        networkServiceAF.networkRequest(networkConfig: config) { result in
            // completion으로 받은 result를 Result<JSON, Error> 타입으로 타입캐스팅
            let result = result as ResultType
            
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                dump(error)
            }
        }
    }
}
