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
    var bannerList: [DallaMainBanner] = []
    var bjStoryList: [DallaBJStory] = []
    var topTenList: Observable<[DallaTopTen]> = Observable(bjDummy)
    var adBannerList: [DallaADBanner] = adBannerDummy
    
    // newBJList를 위한 랜덤 데이터
    let combinedArray = bjDummy + fanDummy + teamDummy
    lazy var newBJList = (1...10).compactMap { _ in combinedArray.randomElement() }
    
    lazy var networkRepository = DallaNetworkRepository(config: networkConfig)
    
    // RequestBannerList Network Class
    private let rqBannerList = DallaNetworkConfig.rqBannerList
    lazy var networkConfig = NetworkConfig(url: rqBannerList.url,
                                           method: rqBannerList.method,
                                           headers: rqBannerList.headers)
    
    init() {
        fetchBannerList()
        fetchBJStoryList()
    }
}

// MARK: DallaMainBanner Methods

extension DallaMainViewModel {
    private func fetchBannerList() {
        networkRepository.fetchData { [weak self] json in
            let bannerList = self?.makeBannerList(json: json)
            if let bannerList = bannerList {
                self?.bannerList = bannerList
                self?.fetchBannerListDummyData()
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
}

// MARK: DallaMainBanner DataSource Methods

extension DallaMainViewModel: MainBannerAdapterDataSource {
    var mainBannerItemCount: Int {
        bannerList.count
    }
    
    func getMainBannerItem(at index: Int) -> DallaMainBanner {
        return bannerList[index]
    }
}

// MARK: DallaMainBanner Delegate Methods

extension DallaMainViewModel: MainBannerAdapterDelegate {
    func didSelectMainBannerItem(item: String) {
        print(item)
    }
}

// MARK: DallaBJStory Methods

extension DallaMainViewModel {
    private func fetchBJStoryList() {
        networkRepository.fetchData { [weak self] json in
            let bjStoryList = self?.makeBJStoryList(json: json)
            if let bjStoryList = bjStoryList {
                // 더미 데이터를 위한 flatMap 함수
                let multipledArray = bjStoryList.flatMap { Array(repeating: $0, count: 5) }
                self?.bjStoryList = multipledArray
            }
        }
    }
    
    private func makeBJStoryList(json: JSON) -> [DallaBJStory] {
        if let bjStoryListArray = json["BannerList"].array {
            let dallaBjStoryListArray = bjStoryListArray.enumerated().map { (index, json) in
                let bannerListDTO = DallaBannerListDTO(json: json)
                
                return bannerListDTO.toBJStoryModel()
            }
            
            return dallaBjStoryListArray
        }
        
        return []
    }
}

// MARK: DallaBJStory DataSource Methods

extension DallaMainViewModel: BJStoryAdapterDataSource {
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

extension DallaMainViewModel: BJStoryAdapterDelegate {}


// MARK: DallaTopTenHeaderView Delegate Methods

extension DallaMainViewModel: TopTenHeaderViewDelegate {
    func didTapHeaderButton(state: HeaderViewButtonState) {
        switch state {
        case .bj:
            topTenList.value = bjDummy
        case .fan:
            topTenList.value = fanDummy
        case .team:
            topTenList.value = teamDummy
        }
    }
    
}

// MARK: DallaADBanner DataSource Methods

extension DallaMainViewModel: ADBannerAdapterDataSource {
    var adBannerItemCount: Int {
        adBannerList.count
    }
    
    func getADBannerItem(at index: Int) -> DallaADBanner {
        return adBannerList[index]
    }
    
    
}

// MARK: DallaADBanner Delegate Methods

extension DallaMainViewModel: ADBannerAdapterDelegate {}
