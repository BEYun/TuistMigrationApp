//
//  LayoutConstraints.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

// MARK: Dalla UI 작업에 필요한 Constraints

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

enum DallaContentViewConstraint {
    static let mainBannerViewHeight: CGFloat = UIScreen.main.bounds.width
    static let bjStoryViewHeight: CGFloat = 120
    static let topTenViewHeight: CGFloat = 260
    static let newBJViewHeight: CGFloat = 192
    static let adBannerHeight: CGFloat = DallaADBannerConstraint.bannerCellHeight
    
    // Vertical Offsets
    static let topTenOffset: CGFloat = 15
    static let newBJTopOffset: CGFloat = 24
    static let adBannerTopOffset: CGFloat = 32
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
    static let profileImageViewSize: CGFloat = 76
    static let backgroundViewSize: CGFloat = 80
    static let bjNameLineHeight: CGFloat = 15
    static let profileImageBottomInset: CGFloat = 4
    static let bjStoryCollectionViewInsets: UIEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
}

enum DallaTopTenConstraint {
    static let categoryStackViewWidth: CGFloat = 107
    static let headerViewHeight: CGFloat = 26
    static let scrollViewHeight: CGFloat = 183
    static let scrollViewTopOffset: CGFloat = 12
    static let footerViewVerticalOffset: CGFloat = 10
    static let footerViewHeight: CGFloat = 25
}

enum DallaBJStackViewItemConstraint {
    static let itemSpacing: CGFloat = 7
    static let profileViewWidth: CGFloat = 116
    static let profileViewHeight: CGFloat = 154
    static let liveButtonSize: CGFloat = 40
    static let rankingNubmerWidth: CGFloat = 49
    static let rankingNumberHeight: CGFloat = 48
    static let profileInnerNameLabelInset: CGFloat = 8
}

enum DallaTopTenFooterViewConstraint {
    static let tipImageWidth: CGFloat = 50
    static let tipImageHeight: CGFloat = 25
    static let contentLabelLeadingOffset: CGFloat = 11
    static let contentLabelVerticalInset: CGFloat = 5
    static let dropButtonTrailingInset: CGFloat = 5
    static let dropButtonSize: CGFloat = 20
}

enum DallaNewBJViewConstraint {
    static let headerViewHeight: CGFloat = 26
    static let scrollViewTopOffset: CGFloat = 12
}

enum DallaADBannerConstraint {
    static let bannerCellWidth: CGFloat = UIScreen.main.bounds.width
    static let bannerCellHeight: CGFloat = 115
}
