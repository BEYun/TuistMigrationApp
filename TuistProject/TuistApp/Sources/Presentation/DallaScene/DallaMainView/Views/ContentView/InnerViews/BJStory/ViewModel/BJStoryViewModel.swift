//
//  BJStoryViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/02.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

class BJStoryViewModel {
    var bjStoryList: [DallaBJStory] = []
    
    lazy var networkRepository = DallaNetworkRepository(config: networkConfig)
    
    // RequestBannerList Network Class
    private let request = DallaNetworkConfig.rqMyStarList
    
    lazy var networkConfig = NetworkConfig(url: request.url,
                                           method: request.method,
                                           headers: request.headers)
    
    // MARK: DallaBJStory Methods
    
    func fetchBJStoryList(completion: @escaping () -> Void) {
        networkRepository.fetchData { [weak self] json in
            let bjStoryList = self?.makeBJStoryList(json: json)
            if let bjStoryList = bjStoryList {
                self?.bjStoryList = bjStoryList
                completion()
            }
        }
    }
    
    private func makeBJStoryList(json: JSON) -> [DallaBJStory] {
        if let bjStoryListArray = json["StarList"].array {
            let dallaBjStoryListArray = bjStoryListArray.enumerated().map { (index, json) in
                let bjStoryListDTO = BJStoryListDTO(json: json)
                
                return bjStoryListDTO.toBJStoryModel()
            }
            
            return dallaBjStoryListArray
        }
        
        return []
    }
    
    deinit {
        print("BJStoryViewModel Deinit")
    }
}

// MARK: DallaBJStory DataSource Methods

extension BJStoryViewModel {
    var bjStoryItemCount: Int {
        return bjStoryList.count
    }
    
    var bjStoryRemainingCount: Int? {
        let itemCount = bjStoryList.count
        if itemCount > 10 {
            let remainingCount = itemCount - 10
            return remainingCount
        } else {
            return nil
        }
    }
    
    func getBJStoryItem(at index: Int) -> DallaBJStory {
        return bjStoryList[index]
    }
}

// MARK: DallaBJStory Delegate Methods

extension BJStoryViewModel {}
