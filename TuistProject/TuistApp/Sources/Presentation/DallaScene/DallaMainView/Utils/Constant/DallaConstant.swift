//
//  ItemCount.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/22.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

enum DallaConstant {
    enum BJStory {
        case defaultCount
        
        var constant: Int {
            switch self {
            case .defaultCount:
                return 11
            }
        }
    }
}
