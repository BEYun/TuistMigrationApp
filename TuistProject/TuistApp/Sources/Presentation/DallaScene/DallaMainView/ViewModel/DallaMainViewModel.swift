//
//  DallaMainViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import SwiftyJSON

class DallaMainViewModel {
    var items2 = ["1","2","3","1","1","2","3","1"]
    
    var bannerList: [DallaBannerList] = []
    
    lazy var networkRepository = DallaNetworkRepository(config: networkConfig)
    
    // RequestBannerList Network Class
    private let rqBannerList = DallaNetworkConfig.rqBannerList
    lazy var networkConfig = NetworkConfig(url: rqBannerList.url,
                                           method: rqBannerList.method,
                                           headers: rqBannerList.headers)
    
    init() {
        fetchBannerList()
    }
    
    func fetchBannerList() {
        networkRepository.fetchData { [weak self] json in
            let bannerList = self?.makeBannerList(json: json)
            if let bannerList = bannerList {
                self?.bannerList = bannerList
            }
        }
    }
    
    private func makeBannerList(json: JSON) -> [DallaBannerList] {
        if let bannerListArray = json["BannerList"].array {
            let dallaBannerListArray = bannerListArray.enumerated().map { (index, json) in
                let bannerListDTO = DallaBannerListDTO(json: json)
                return bannerListDTO.toModel()
            }
            
            return dallaBannerListArray
        }
        return []
    }
}

extension DallaMainViewModel: MainBannerAdapterDataSource {
    var mainBannerItemCount: Int {
        bannerList.count
    }
    
    func getMainBannerItem(at index: Int) -> DallaBannerList {
        return bannerList[index]
    }
}

extension DallaMainViewModel: MainBannerAdapterDelegate {
    func didSelectMainBannerItem(item: String) {
        print(item)
    }
}

extension DallaMainViewModel: BJStoryAdapterDataSource {
    var bjStoryItemCount: Int {
        items2.count
    }
    
    func getBJStoryItem(at index: Int) -> String {
        return items2[index]
    }
}

extension DallaMainViewModel: BJStoryAdapterDelegate {}
