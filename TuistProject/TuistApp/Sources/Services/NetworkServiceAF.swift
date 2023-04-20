//
//  NetworkServiceAF.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkServiceAF {
    let networkConfig: NetworkConfig
    
    init(networkConfig: NetworkConfig) {
        self.networkConfig = networkConfig
    }

    // alamofire를 이용한 네트워크 제네릭 메소드
    func networkRequest<T: Decodable>(networkConfig: NetworkConfig, completion: @escaping (Result<T, Error>) -> Void) {
        let networkConfig = self.networkConfig

        AF.request(networkConfig.url,
                   method: networkConfig.method,
                   parameters: networkConfig.parameter,
                   headers: networkConfig.headers)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

                                   
