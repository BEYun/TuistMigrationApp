//
//  Constant.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

enum DallaDefaultConstraint {
    static let horizontalInset: CGFloat = 16
}

enum DallaMainConstraint{
    static let headerViewHeight: CGFloat = 52
    static let footerViewHeight: CGFloat = 50
}

enum DallaHeaderConstraint {
    static let headerButtonSize: CGFloat = 40
    static let headerStackVertical: CGFloat = 6
    static let headerStackTrailing: CGFloat = 8
}

enum DallaFooterConstraint {
    static let footerButtonSize: CGFloat = 40
    static let footerStackVertical: CGFloat = 5
    static let footerStackHorizontal: CGFloat = 20
}

enum DallaMainBannerConstraint {
    static let mainCellSize: CGFloat = UIScreen.main.bounds.width
    static let infoViewLeading: CGFloat = 17
    static let bjNameLabelBottom: CGFloat = 14
    static let itemTitleBottom: CGFloat = 9
    static let itemBadgeBottom: CGFloat = 8
}

enum DallaBJStoryConstraint {
    static let bjStoryButtonSize: CGFloat = 76
    static let backgroundViewSize: CGFloat = 80
    static let bjStoryCollectionViewInsets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
}
