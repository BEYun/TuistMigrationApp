//
//  LiveRoomDTO.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/04.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

import SwiftyJSON

class LiveRoomDTO: Codable {
    let roomTitle: String
    let teamBgCode: String
    let thumbnailUrl: String
    let msgWelcom: String
    let risingYn: String
    let roomState: Int
    let bjProfileImage: String
    let subjectType: String
    let bjMemNo: String
    let teamMedalUrl: String
    let roomNo: Int
    let countEntry: Int
    let typeImage: Int
    let codeLink: String
    let guestProfileImage: String
    let imageBackground: String
    let bjNickName: String
    let dayLiveDjRank: Int
    let playTime: Int
    let startDate: String
    let countLiveMax: Int
    let countGood: Int
    let totRoomScore: Int
    let bjProfileImageYn: String
    let countLiveMem: Int
    let bjBirthYear: String
    let countByeol: Int
    let bjMemSex: String
    let teamEdgeUrl: String
    let teamBgUrl: String
    let typeMedia: String
    
    init(json: JSON) {
        roomTitle = json["roomTitle"].stringValue
        teamBgCode = json["teamBgCode"].stringValue
        thumbnailUrl = json["thumbnailUrl"].stringValue
        msgWelcom = json["msgWelcom"].stringValue
        risingYn = json["risingYn"].stringValue
        roomState = json["roomState"].intValue
        bjProfileImage = json["bjProfileImage"].stringValue
        subjectType = json["subjectType"].stringValue
        bjMemNo = json["bjMemNo"].stringValue
        teamMedalUrl = json["teamMedalUrl"].stringValue
        roomNo = json["roomNo"].intValue
        countEntry = json["countEntry"].intValue
        typeImage = json["typeImage"].intValue
        codeLink = json["codeLink"].stringValue
        guestProfileImage = json["guestProfileImage"].stringValue
        imageBackground = json["imageBackground"].stringValue
        bjNickName = json["bjNickName"].stringValue
        dayLiveDjRank = json["dayLiveDjRank"].intValue
        playTime = json["playTime"].intValue
        startDate = json["startDate"].stringValue
        countLiveMax = json["countLiveMax"].intValue
        countGood = json["countGood"].intValue
        totRoomScore = json["totRoomScore"].intValue
        bjProfileImageYn = json["bjProfileImageYn"].stringValue
        countLiveMem = json["countLiveMem"].intValue
        bjBirthYear = json["bjBirthYear"].stringValue
        countByeol = json["countByeol"].intValue
        bjMemSex = json["bjMemSex"].stringValue
        teamEdgeUrl = json["teamEdgeUrl"].stringValue
        teamBgUrl = json["teamBgUrl"].stringValue
        typeMedia = json["typeMedia"].stringValue
    }
}

extension LiveRoomDTO {
    func toLiveRoomModel() -> DallaLiveRoom {
        let roomTitle = self.roomTitle
        let bjProfileImage = self.bjProfileImage
        let bjNickName = self.bjNickName
        let guestProfileImage = self.guestProfileImage
        let countGood = self.countGood
        let countLiveMem = self.countLiveMem
        let bjMemGender = self.bjMemSex
        let typeMedia = self.typeMedia
        
        return DallaLiveRoom(roomTitle: roomTitle,
                             bjProfileImage: bjProfileImage,
                             bjNickName: bjNickName,
                             guestProfileImage: guestProfileImage,
                             countGood: countGood,
                             countLiveMem: countLiveMem,
                             bjMemGender: bjMemGender,
                             typeMedia: typeMedia)
    }
}
