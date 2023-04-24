//
//  DallaTopTenModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/24.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

enum LiveState {
    case live
    case listen
    case none
}

struct DallaTopTenModel {
    let memNick: String
    let profileImage: UIImage?
    let liveButtonState: LiveState
    let ranking: Int?
    
    init(memNick: String, profileImage: UIImage?, liveButtonState: LiveState, ranking: Int?) {
        self.memNick = memNick
        self.profileImage = profileImage ?? UIImage(named: "profile_none")
        self.liveButtonState = liveButtonState
        self.ranking = ranking
    }
}
