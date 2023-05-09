//
//  DallaMainBannerView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then
import SnapKit

class DallaMainBannerCollectionView: UICollectionView {
    typealias Constraint = DallaMainBannerConstraint
    
    let viewModel: MainBannerViewModel
    
    lazy var mainBannerTimer = AutoScrollTimer(autoScrollTime: 5, collectionView: self)
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = .init(width: Constraint.mainCellSize, height: Constraint.mainCellSize)
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    }
    
    init(viewModel: MainBannerViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        setUpCollectionView()
        fetchBannerList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCollectionView() {
        delegate = self
        dataSource = self
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentInset = .zero
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.register(DallaMainBannerCell.self, forCellWithReuseIdentifier: "DallaMainBannerCell")
        self.isPagingEnabled = true
    }
    
    private func fetchBannerList() {
        viewModel.fetchBannerList {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    private func setAutoScroll(scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let contentWidth = scrollView.contentSize.width
        let scrollViewWidth = scrollView.frame.width

        if offsetX < 0 {
            scrollView.contentOffset.x = contentWidth - scrollViewWidth
        } else if offsetX > contentWidth - scrollViewWidth {
            scrollView.contentOffset.x = 0
        } else if offsetX == contentWidth - scrollViewWidth {
            if mainBannerTimer.isAutoScroll {
                scrollView.contentOffset.x = 0
            }
        }
    }
}

extension DallaMainBannerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = viewModel.mainBannerItemCount

        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaMainBannerCell", for: indexPath)
                as? DallaMainBannerCell else { return DallaMainBannerCell() }
        let item = viewModel.getMainBannerItem(at: indexPath.row)
        
        cell.configure(banner: item)
        
        return cell
    }
}

extension DallaMainBannerCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constraint.mainCellSize, height: Constraint.mainCellSize)
    }
}

extension DallaMainBannerCollectionView: UICollectionViewDelegate {
    // MainBannerCollectionView 가로 무한 스크롤
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setAutoScroll(scrollView: scrollView)
    }
    
    // 스크롤 시작 시, 타이머 일시정지
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        mainBannerTimer.timer.suspendTimer()
        mainBannerTimer.isAutoScroll = false
    }
    
    
    // 스크롤 끝날 시, 타이머 재개
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        mainBannerTimer.timer.resumeTimer()
        mainBannerTimer.isAutoScroll = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.getMainBannerItem(at: indexPath.row)
        
        viewModel.didSelectMainBannerItem(item: item)
    }
    
}
