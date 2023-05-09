//
//  MainBannerViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/02.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

class MainBannerViewModel {
    lazy var bannerList: [DallaMainBanner] = []
//    lazy var selectedItem: Observable<DallaMainBanner> = Observable(DallaMainBanner())
    
    lazy var networkRepository = DallaNetworkRepository(config: networkConfig)
    
    // RequestBannerList Network Class
    private let request = DallaNetworkConfig.rqBannerList
    lazy var networkConfig = NetworkConfig(url: request.url,
                                           method: request.method,
                                           headers: request.headers)
    
    // MARK: DallaMainBanner Methods
    
    func fetchBannerList(completion: @escaping () -> Void) {
        networkRepository.fetchData { [weak self] json in
            let bannerList = self?.makeBannerList(json: json)
            if let bannerList = bannerList {
                self?.bannerList = bannerList
                self?.fetchBannerListDummyData()
                completion()
            }
        }
    }
    
    private func makeBannerList(json: JSON) -> [DallaMainBanner] {
        if let bannerListArray = json["BannerList"].array {
            let dallaBannerListArray = bannerListArray.enumerated().map { (index, json) in
                let bannerListDTO = DallaBannerListDTO(json: json)
                
                return bannerListDTO.toBannerListModel()
            }
            
            return dallaBannerListArray
        }
        
        return []
    }
    
    // 무한 스크롤을 위한 마지막 데이터 추가
    private func fetchBannerListDummyData() {
        if let firstItem = bannerList.first {
            bannerList.append(firstItem)
        }
    }
    
    deinit {
        print("MainBannerViewModel Deinit")
    }
}

// MARK: DallaMainBanner DataSource Methods

extension MainBannerViewModel {
    var mainBannerItemCount: Int {
        bannerList.count
    }
    
    func getMainBannerItem(at index: Int) -> DallaMainBanner {
        return bannerList[index]
    }
}

// MARK: DallaMainBanner Delegate Methods

extension MainBannerViewModel {
    func didSelectMainBannerItem(item: DallaMainBanner) {
//        selectedItem.value = item
    }
}
