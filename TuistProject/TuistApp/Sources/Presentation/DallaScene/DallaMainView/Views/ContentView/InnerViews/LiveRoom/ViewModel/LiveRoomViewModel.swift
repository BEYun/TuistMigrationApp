//
//  LiveViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

class LiveRoomViewModel {
    var liveRoomList: Observable<[DallaLiveRoom]> = Observable([])
    
    lazy var networkRepository = DallaNetworkRepository(config: networkConfig)
    
    // RequestBannerList Network Class
    private let request = DallaNetworkConfig.rqRoomList
    private var initParam = ["pageNo" : 1]
    
    lazy var networkConfig = NetworkConfig(url: request.url,
                                           method: request.method,
                                           parameter: initParam,
                                           headers: request.headers)
    
    // MARK: DallaLiveRoom Methods
    
    func fetchLiveRoomList(completion: @escaping () -> Void) {
        networkRepository.fetchData { [weak self] json in
            let liveRoomList = self?.makeLiveRoomList(json: json)
            if let liveRoomList = liveRoomList {
                self?.liveRoomList.value = liveRoomList
                completion()
            }
        }
    }
    
    private func makeLiveRoomList(json: JSON) -> [DallaLiveRoom] {
        if let liveRoomListArray = json["RoomList"].array {
            let dallaLiveRoomListArray = liveRoomListArray.enumerated().map { (index, json) in
                let liveRoomListDTO = LiveRoomDTO(json: json)
                
                return liveRoomListDTO.toLiveRoomModel()
            }
            
            return dallaLiveRoomListArray
        }
        
        return []
    }
    
    private func setNetworkRepository(param: Int) {
        initParam = ["pageNo" : param]
        networkConfig = NetworkConfig(url: request.url,
                                      method: request.method,
                                      parameter: initParam,
                                      headers: request.headers)
        networkRepository = DallaNetworkRepository(config: networkConfig)
    }
    
    deinit {
        print("LiveRoomViewModel Deinit")
    }
}

// MARK: DallaLiveRoom DataSource Methods

extension LiveRoomViewModel {
    var liveItemCount: Int {
        return liveRoomList.value.count
    }
    
    func getLiveRoomListItem(at index: Int) -> DallaLiveRoom? {
        return liveRoomList.value[index]
    }
}

// MARK: DallaLiveRoom Delegate Methods

extension LiveRoomViewModel {}

// MARK: DallaLiveRoom HeaderView Delegate

extension LiveRoomViewModel: RoomHeaderViewDelegate {
    func didTapHeaderButton(state: RoomHeaderViewButtonState) {
        switch state {
        case .all:
            setNetworkRepository(param: 1)
            fetchLiveRoomList{}
        case .video:
            setNetworkRepository(param: 2)
            fetchLiveRoomList{}
        case .radio:
            setNetworkRepository(param: 3)
            fetchLiveRoomList{}
        case .newDJ:
            setNetworkRepository(param: 4)
            fetchLiveRoomList{}
        }
    }
}
