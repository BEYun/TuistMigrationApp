//
//  EventBannerListDTO.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

struct EventBannerListDTO {
    let idx: Int
    let bannerUrl: String
    let linkUrl: String
    
    init(json: JSON) {
        idx = json["idx"].intValue
        bannerUrl = json["bannerUrl"].stringValue
        linkUrl = json["linkUrl"].stringValue
    }
}

//MARK: 필요한 데이터 모델로 변환

extension EventBannerListDTO {
    func toEventBannerModel() -> DallaEventBanner {
        let bannerURL = self.bannerUrl
        
        return DallaEventBanner(bannerURL: bannerURL)
    }
}
