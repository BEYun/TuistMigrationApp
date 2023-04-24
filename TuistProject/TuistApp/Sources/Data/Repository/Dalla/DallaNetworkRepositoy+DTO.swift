//
//  DallaNetworkRepositoy+DTO.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

//MARK: DallaBanner의 response를 파싱할 수 있는 DTO

struct DallaBannerListDTO {
    let memNo: String
    let subjectType: String
    let idx: Int
    let buttonNm: String
    let typeImage: Int
    let thumbsUrl: String
    let risingYn: String
    let imageProfile: String
    let thumbnailUrl: String
    let contents: String
    let memNick: String
    let title: String
    let isCookie: Int
    let imageBackground: String
    let badgeSpecial: Int
    let linkUrl: String
    let popupType: Int
    let isTitleView: Int
    let memSex: String
    let conDjYn: Int
    let isButtonView: Int
    let roomNo: String
    let profileImage: [String: String]
    let badgeNewdj: Int
    let bjGradeBadgeList: [String: String]
    let linkType: String
    let djGrade: String
    let bannerUrl: String
    
    init(json: JSON) {
        memNo = json["mem_no"].stringValue
        subjectType = json["subject_type"].stringValue
        idx = json["idx"].intValue
        buttonNm = json["buttonNm"].stringValue
        typeImage = json["type_image"].intValue
        thumbsUrl = json["thumbsUrl"].stringValue
        risingYn = json["risingYn"].stringValue
        imageProfile = json["image_profile"].stringValue
        thumbnailUrl = json["thumbnailUrl"].stringValue
        contents = json["contents"].stringValue
        memNick = json["mem_nick"].stringValue
        title = json["title"].stringValue
        isCookie = json["is_cookie"].intValue
        imageBackground = json["image_background"].stringValue
        badgeSpecial = json["badgeSpecial"].intValue
        linkUrl = json["linkUrl"].stringValue
        popupType = json["popup_type"].intValue
        isTitleView = json["is_title_view"].intValue
        memSex = json["mem_sex"].stringValue
        conDjYn = json["conDjYn"].intValue
        isButtonView = json["is_button_view"].intValue
        roomNo = json["room_no"].stringValue
        profileImage = json["imageProfile"].dictionaryValue.mapValues { $0.stringValue }
        badgeNewdj = json["badgeNewdj"].intValue
        bjGradeBadgeList = json["bjGradeBadgeList"].dictionaryValue.mapValues { $0.stringValue }
        linkType = json["linkType"].stringValue
        djGrade = json["djGrade"].stringValue
        bannerUrl = json["bannerUrl"].stringValue
    }

}

//MARK: 필요한 데이터 모델로 변환

extension DallaBannerListDTO {
    // BannerListModel
    func toBannerListModel() -> DallaMainBanner {
        let memNick = self.memNick
        let title = self.title
        let badgeSpecial = self.badgeSpecial
        let backgroundImageURL = self.imageBackground
        
        return DallaMainBanner(memNick: memNick,
                               title: title,
                               badgeSpecial: badgeSpecial,
                               backgroundImageURL: backgroundImageURL)
    }
    
    // BJStoryModel
    func toBJStoryModel() -> DallaBJStory {
        let memNick = self.memNick
        let profileImageURL = self.profileImage["thumb80x80"]
        let isChecked = false
        
        return DallaBJStory(memNick: memNick,
                            profileImageUrl: profileImageURL,
                            isChecked: isChecked)
    }
  
    // Index Test Function
    func toBannerListModel(index: Int) -> DallaMainBanner {
        let memNick = self.memNick
        let title = self.title + "\(index)"
        let badgeSpecial = self.badgeSpecial
        let backgroundImageURL = self.imageBackground

        return DallaMainBanner(memNick: memNick,
                               title: title,
                               badgeSpecial: badgeSpecial,
                               backgroundImageURL: backgroundImageURL)
    }
}
