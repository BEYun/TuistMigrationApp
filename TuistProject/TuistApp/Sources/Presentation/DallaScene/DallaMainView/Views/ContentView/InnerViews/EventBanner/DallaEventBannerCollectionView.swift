//
//  DallaEventBannerCollectionView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then

class DallaEventBannerCollectionView: UICollectionView {
    typealias Constraint = DallaEventBannerConstraint
    
    let viewModel = EventBannerViewModel()
    let hello = UITableView()
    lazy var eventBannerTimer = AutoScrollTimer(autoScrollTime: 5, collectionView: self)
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout().then({
        $0.scrollDirection = .horizontal
        $0.itemSize = .init(width: Constraint.bannerCellWidth, height: Constraint.bannerCellHeight)
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    })

    init() {
        super.init(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        setUpMainBannerCollectionView()
        fetchEventBannerList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpMainBannerCollectionView() {
        delegate = self
        dataSource = self
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentInset = .zero
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.register(DallaEventBannerCell.self, forCellWithReuseIdentifier: "DallaEventBannerCell")
        self.isPagingEnabled = true
    }
    
    private func fetchEventBannerList() {
        viewModel.fetchEventBannerList {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
}

extension DallaEventBannerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = viewModel.eventBannerItemCount

        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaEventBannerCell", for: indexPath)
                as? DallaEventBannerCell else { return DallaEventBannerCell() }
        let item = viewModel.getEventBannerItem(at: indexPath.row)
        
        cell.configure(banner: item)
        
        return cell
    }
}

extension DallaEventBannerCollectionView: UICollectionViewDelegate {
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
            if eventBannerTimer.isAutoScroll {
                scrollView.contentOffset.x = 0
            }
        }
    }
    
    // 스크롤 시작 시, 타이머 일시정지
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        eventBannerTimer.timer.suspendTimer()
        eventBannerTimer.isAutoScroll = false
    }
    
    
    // 스크롤 끝날 시, 타이머 재개
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        eventBannerTimer.timer.resumeTimer()
        eventBannerTimer.isAutoScroll = true
    }
}
