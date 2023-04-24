//
//  DallaBannerList.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

struct DallaMainBanner {
    let memNick: String
    let title: String?
    let badgeSpecial: Int
    let backgroundImageURL: String?
    
    init(memNick: String, title: String, badgeSpecial: Int, backgroundImageURL: String?) {
        self.memNick = memNick
        self.title = title
        self.badgeSpecial = badgeSpecial
        self.backgroundImageURL = backgroundImageURL
    }
}
