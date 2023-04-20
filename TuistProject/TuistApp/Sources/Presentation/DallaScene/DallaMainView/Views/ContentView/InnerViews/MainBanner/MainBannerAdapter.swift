//
//  DallaMainBannerView+CollectionView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

protocol MainBannerAdapterDataSource: AnyObject {
    var mainBannerItemCount: Int { get }
    
    func getMainBannerItem(at index: Int) -> DallaBannerList
}

protocol MainBannerAdapterDelegate: AnyObject {
    func didSelectMainBannerItem(item: String)
}

class MainBannerAdapter: NSObject {
    private var timer: DispatchSourceTimer?
    private var autoScrollTime: Int = 5
    
    weak var adapterDataSource: MainBannerAdapterDataSource?
    weak var adapterDelegate: MainBannerAdapterDelegate?

    init(collectionView: UICollectionView) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    public func makeTimer() {
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            timer?.schedule(deadline: .now(), repeating: .seconds(autoScrollTime))
            timer?.setEventHandler(handler: {
                
            })
        }
        
        timer?.resume()
        
    }
    
    private func resumeTimer() {
        timer?.resume()
    }
    
    private func suspendTimer() {
        timer?.suspend()
    }
    
    private func cancelTimer() {
        timer?.cancel()
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
        } else if offsetX > contentWidth - scrollViewWidth {
            scrollView.contentOffset.x = 0
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("stop")
        suspendTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("start")
        resumeTimer()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let title = adapterDataSource?.getMainBannerItem(at: indexPath.row).title else { return }
        
        adapterDelegate?.didSelectMainBannerItem(item: title)
    }
}

