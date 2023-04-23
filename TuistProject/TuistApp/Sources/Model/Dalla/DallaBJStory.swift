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
    let isChecked: Bool
    
    init(memNick: String, profileImageUrl: String?, isChecked: Bool) {
        self.memNick = memNick
        self.profileImageUrl = profileImageUrl
        self.isChecked = isChecked
    }
}
