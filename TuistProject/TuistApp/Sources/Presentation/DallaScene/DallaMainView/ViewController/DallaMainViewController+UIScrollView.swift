//
//  DallaMainViewController+UIScrollView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/28.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

extension DallaMainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let minOffset = DallaMainBannerConstraint.mainCellSize - DallaMainBannerConstraint.infoViewHeight - DallaMainConstraint.headerViewHeight
        let maxOffset = DallaMainBannerConstraint.mainCellSize - DallaMainConstraint.headerViewHeight
        let offsetY = scrollView.contentOffset.y
        
        headerMenuView.toggleBackgroundColor(offsetY: offsetY, minOffset: minOffset, maxOffset: maxOffset)
//        setMainBannerAnimation(scrollView: scrollView)
    }
    
    // 스크롤 시작 시, 타이머 일시정지
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        guard let scrollView = scrollView as? DallaContentView else { return }
        let collectionView = scrollView.mainBannerCollectionView
        collectionView.mainBannerTimer.timer.suspendTimer()
        collectionView.mainBannerTimer.isAutoScroll = false
    }
    
    
    // 스크롤 끝날 시, 타이머 재개
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let scrollView = scrollView as? DallaContentView else { return }
        let collectionView = scrollView.mainBannerCollectionView
        collectionView.mainBannerTimer.timer.resumeTimer()
        collectionView.mainBannerTimer.isAutoScroll = true
    }
}

extension DallaMainViewController {
    private func setMainBannerAnimation(scrollView: UIScrollView) {
        guard let scrollView = scrollView as? DallaContentView else { return }
        
        let offsetY = scrollView.contentOffset.y

        if offsetY < 0 {
            let scaleFactor = 1 - offsetY / scrollView.mainBannerCollectionView.frame.height
            scrollView.mainBannerCollectionView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        } else {
            scrollView.mainBannerCollectionView.transform = .identity
        }
    }
}
