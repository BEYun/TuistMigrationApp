//
//  ADBannerAdapter.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/24.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

// MARK: ADBannerCollectionView와 MainViewModel간의 Data Binding을 위한 Adapter Class

// MainBanner CollectionView DataSource 위임을 위한 Protocol
protocol ADBannerAdapterDataSource: AnyObject {
    var adBannerItemCount: Int { get }
    
    func getADBannerItem(at index: Int) -> DallaADBanner
}

// MainBanner CollectionView Delegate 위임을 위한 Protocol
protocol ADBannerAdapterDelegate: AnyObject {
//    func didSelectMainBannerItem(item: String)
}

class ADBannerAdapter: NSObject {
    let timer = RepeatingActionTimer()
    private let autoScrollTime: Int = 5
    private var isAutoScroll: Bool = true
    
    weak var adapterDataSource: ADBannerAdapterDataSource?
    weak var adapterDelegate: ADBannerAdapterDelegate?

    init(collectionView: UICollectionView) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpTimerAction(collectionView: collectionView)
    }
    
    // 자동 스크롤 기능인 autoScroll 메소드를 timer의 Handler의 클로저에서 호출
    private func setUpTimerAction(collectionView: UICollectionView) {
        timer.makeTimer(deadline: .now() + .seconds(autoScrollTime), repeating: autoScrollTime) { [weak self] in
            self?.autoScroll(collectionView: collectionView)
        }
    }
    
    // 자동 스크롤 기능
    private func autoScroll(collectionView: UICollectionView) {
        let nextPageIndex = trunc((collectionView.contentOffset.x + collectionView.frame.width) / collectionView.frame.width),
            nextPageOffset = CGPoint(x: nextPageIndex * collectionView.frame.width, y: 0)
        
        collectionView.setContentOffset(nextPageOffset, animated: true)

    }
    
    deinit {
        timer.cancelTimer()
    }
    
}

extension ADBannerAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfItems = adapterDataSource?.adBannerItemCount else { return 0 }

        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaADBannerCell", for: indexPath)
                as? DallaADBannerCell else { return DallaADBannerCell() }
        guard let item = adapterDataSource?.getADBannerItem(at: indexPath.row) else { return DallaADBannerCell() }
        
        cell.configure(banner: item)
        
        return cell
    }
}

extension ADBannerAdapter: UICollectionViewDelegate {
    
    // MainBannerCollectionView 가로 무한 스크롤
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        let scrollViewWidth = scrollView.frame.width

        if offsetX < 0 {
            scrollView.contentOffset.x = contentWidth - scrollViewWidth
        } else if offsetX > contentWidth - scrollViewWidth {
            scrollView.contentOffset.x = 0
        } else if offsetX == contentWidth - scrollViewWidth {
            if isAutoScroll {
                scrollView.contentOffset.x = 0
            }
        }
    }
    
    // 스크롤 시작 시, 타이머 일시정지
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.suspendTimer()
        isAutoScroll = false
    }
    
    
    // 스크롤 끝날 시, 타이머 재개
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer.resumeTimer()
        isAutoScroll = true
    }
}
