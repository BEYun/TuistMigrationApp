//
//  DallaNetworkRepository.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import SwiftyJSON

class DallaNetworkRepository {
    typealias ResultType = Result<JSON, Error>
    
    let config: NetworkConfig
    
    init(config: NetworkConfig) {
        self.config = config
    }
    
    func fetchData(completion: @escaping (JSON) -> Void) {
        let networkServiceAF = NetworkServiceAF(networkConfig: config)
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
