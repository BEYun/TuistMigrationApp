//
//  BJStoryListDTO.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

struct BJStoryListDTO: Codable {
    let memNo: Int
    let nickNm: String
    let roomNo: Int
    let typeEntry: Int
    let title: String
    let roomType: String
    let roomTypeNm: String
    let profImg: ProfImg
    let roomYn: String

    init(json: JSON) {
        memNo = json["memNo"].intValue
        nickNm = json["nickNm"].stringValue
        roomNo = json["roomNo"].intValue
        typeEntry = json["typeEntry"].intValue
        title = json["title"].stringValue
        roomType = json["roomType"].stringValue
        roomTypeNm = json["roomTypeNm"].stringValue
        profImg = ProfImg(json: json["profImg"])
        roomYn = json["roomYn"].stringValue
    }
}

struct ProfImg: Codable {
    let url: String
    let path: String

    init(json: JSON) {
        url = json["url"].stringValue
        path = json["path"].stringValue
    }
}

//MARK: 필요한 데이터 모델로 변환

extension BJStoryListDTO {
    func toBJStoryModel() -> DallaBJStory {
        let memNick = self.nickNm
        let profileImageUrl = self.profImg.url
        let roomYn = self.roomYn
        
        return DallaBJStory(memNick: memNick, profileImageUrl: profileImageUrl, roomYn: roomYn)
    }
}
