//
//  MainBannerTimer.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class AutoScrollTimer {
    let timer = RepeatingActionTimer()
    let collectionView: UICollectionView
    let autoScrollTime: Int
    var isAutoScroll: Bool = true
    
    init(autoScrollTime: Int, collectionView: UICollectionView) {
        self.autoScrollTime = autoScrollTime
        self.collectionView = collectionView
    }

    // 자동 스크롤 기능인 autoScroll 메소드를 timer의 Handler의 클로저에서 호출
    func setUpTimerAction() {
        timer.makeTimer(deadline: .now() + .seconds(autoScrollTime), repeating: autoScrollTime) { [weak self] in
            self?.autoScroll()
        }
    }
    
    // 자동 스크롤 기능
    func autoScroll() {
        let nextPageIndex = trunc((collectionView.contentOffset.x + collectionView.frame.width) / collectionView.frame.width),
            nextPageOffset = CGPoint(x: nextPageIndex * collectionView.frame.width, y: 0)
        
        collectionView.setContentOffset(nextPageOffset, animated: true)
    }
    
    deinit {
        timer.cancelTimer()
    }
    
}

