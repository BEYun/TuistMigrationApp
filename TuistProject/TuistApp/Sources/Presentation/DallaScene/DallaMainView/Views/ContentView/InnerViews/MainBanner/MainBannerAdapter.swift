//
//  DallaMainBannerView+CollectionView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

// MainBanner CollectionView DataSource 위임을 위한 Protocol
protocol MainBannerAdapterDataSource: AnyObject {
    var mainBannerItemCount: Int { get }
    
    func getMainBannerItem(at index: Int) -> DallaBannerList
}
// MainBanner CollectionView Delegate 위임을 위한 Protocol
protocol MainBannerAdapterDelegate: AnyObject {
    func didSelectMainBannerItem(item: String)
}

class MainBannerAdapter: NSObject {
    let timer = RepeatingActionTimer()
    private let autoScrollTime: Int = 5
    
    weak var adapterDataSource: MainBannerAdapterDataSource?
    weak var adapterDelegate: MainBannerAdapterDelegate?

    init(collectionView: UICollectionView) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpTimerAction(collectionView: collectionView)
    }
    
    // 자동 스크롤 기능인 autoScroll 메소드를 timer의 Handler의 클로저에서 호출
    private func setUpTimerAction(collectionView: UICollectionView) {
        timer.makeTimer(deadline: .now(), repeating: autoScrollTime) { [weak self] in
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

extension MainBannerAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfItems = adapterDataSource?.mainBannerItemCount else { return 0 }

        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaMainBannerCell", for: indexPath)
                as? DallaMainBannerCell else { return DallaMainBannerCell() }
        guard let item = adapterDataSource?.getMainBannerItem(at: indexPath.row) else { return DallaMainBannerCell() }
        
        cell.configure(bannerList: item)
        
        return cell
    }
}

extension MainBannerAdapter: UICollectionViewDelegate {
    // MainBannerCollectionView 가로 무한 스크롤
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        let scrollViewWidth = scrollView.frame.width

        if offsetX < 0 {
            scrollView.contentOffset.x = contentWidth - scrollViewWidth
        } else if offsetX >= contentWidth - scrollViewWidth {
            scrollView.contentOffset.x = 0
        }
    }
    
    // 
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer.suspendTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer.resumeTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let title = adapterDataSource?.getMainBannerItem(at: indexPath.row).title else { return }
        
        adapterDelegate?.didSelectMainBannerItem(item: title)
    }
}



//func moveToNext() {
//       guard !isHolding else { return }
//
//       let nextPageIndex = trunc((self.contentOffset.x + self.frame.width) / self.frame.width),
//           nextPageOffset = CGPoint(x: nextPageIndex * self.frame.width, y: 0)
//
//       
//
//       self.setContentOffset(nextPageOffset, animated: true)
//   }
