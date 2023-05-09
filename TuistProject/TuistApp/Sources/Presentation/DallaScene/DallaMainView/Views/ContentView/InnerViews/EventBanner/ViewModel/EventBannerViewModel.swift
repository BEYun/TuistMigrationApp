//
//  EventBannerViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/02.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

class EventBannerViewModel {
    var eventBannerList: [DallaEventBanner] = []
    
    lazy var networkRepository = DallaNetworkRepository(config: networkConfig)
    
    // RequestBannerList Network Class
    private let request = DallaNetworkConfig.rqEventBannerList
    
    lazy var networkConfig = NetworkConfig(url: request.url,
                                           method: request.method,
                                           headers: request.headers)
    
    // MARK: DallaEventBanner Methods
    
    func fetchEventBannerList(completion: @escaping () -> Void) {
        networkRepository.fetchData { [weak self] json in
            let eventBannerList = self?.makeEventBannerList(json: json)
            if let eventBannerList = eventBannerList {
                self?.eventBannerList = eventBannerList
                self?.fetchEventBannerListDummyData()
                completion()
            }
        }
    }
    
    private func makeEventBannerList(json: JSON) -> [DallaEventBanner] {
        if let eventBannerListArray = json["BannerList"].array {
            let dallaeventBannerListArray = eventBannerListArray.enumerated().map { (index, json) in
                let eventBannerListDTO = EventBannerListDTO(json: json)
                
                return eventBannerListDTO.toEventBannerModel()
            }
            
            return dallaeventBannerListArray
        }
        
        return []
    }
    
    // 무한 스크롤을 위한 마지막 데이터 추가
    private func fetchEventBannerListDummyData() {
        if let firstItem = eventBannerList.first {
            eventBannerList.append(firstItem)
        }
    }
    
    deinit {
        print("EventBannerViewModel Deinit")
    }

}

// MARK: DallaEventBanner DataSource Methods

extension EventBannerViewModel {
    var eventBannerItemCount: Int {
        eventBannerList.count
    }
    
    func getEventBannerItem(at index: Int) -> DallaEventBanner {
        return eventBannerList[index]
    }
}
