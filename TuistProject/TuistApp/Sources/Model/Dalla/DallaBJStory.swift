//
//  DallaBJStory.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/21.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

struct DallaBJStory {
    let memNick: String
    let profileImageUrl: String?
    let roomYn: String
    
    init(memNick: String, profileImageUrl: String?, roomYn: String) {
        self.memNick = memNick
        self.profileImageUrl = profileImageUrl
        self.roomYn = roomYn
    }
}
