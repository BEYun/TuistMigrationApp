//
//  DallaBJStoryCollectionView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

class DallaBJStoryCollectionView: UICollectionView {
    typealias Constraint = DallaBJStoryConstraint
    
    let viewModel = BJStoryViewModel()

    let collectionViewFlowLayout = UICollectionViewFlowLayout().then({
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 12
    })
    
    init() {
        super.init(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        setUpBJStoryCollectionView()
        fetchBJStoryList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpBJStoryCollectionView() {
        backgroundColor = .white
        delegate = self
        dataSource = self
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentInset = Constraint.bjStoryCollectionViewInsets
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.register(DallaBJStoryCell.self, forCellWithReuseIdentifier: "DallaBJStoryCell")
    }
    
    private func fetchBJStoryList() {
        viewModel.fetchBJStoryList {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
}

extension DallaBJStoryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfItems = viewModel.bjStoryItemCount
        
        // bjStory 최대 item 갯수가 10개 이므로, item이 10개 이하일 시(bjStoryRemainingCount == nil), item 갯수를 반환한다.
        // item이 10개 초과일 시(bjStoryRemainingCount != nil), 10개의 item + 남은 itemCount를 보여줄 item 갯수를 반환한다.
        if viewModel.bjStoryRemainingCount != nil {
            let constantCount = DallaConstant.BJStory.defaultCount.constant
            return constantCount
        } else {
            return numberOfItems
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaBJStoryCell", for: indexPath)
                as? DallaBJStoryCell else { return DallaBJStoryCell() }
        let bjStoryitem = viewModel.getBJStoryItem(at: indexPath.row)

        let constantCount = DallaConstant.BJStory.defaultCount.constant
        // item이 10개 초과이며 마지막 indexPath.row일 때, bjStoryRemainingCount를 Cell에 반환
        // 그렇지 않으면, bjStory 데이터 반환
        if let remainingCount = viewModel.bjStoryRemainingCount, indexPath.row == (constantCount - 1) {
            cell.configureRemainingCount(count: remainingCount)
        } else {
            cell.configure(bjStory: bjStoryitem)
        }
        
        return cell
    }
}

extension DallaBJStoryCollectionView: UICollectionViewDelegate {}

extension DallaBJStoryCollectionView: UICollectionViewDelegateFlowLayout {
    // cell의 itemSize 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedWidth = DallaBJStoryConstraint.backgroundViewSize
        let estimatedHeight = DallaBJStoryConstraint.backgroundViewSize
                                + DallaBJStoryConstraint.profileImageBottomInset
                                + DallaBJStoryConstraint.bjNameLineHeight
        
        let itemSize = CGSizeMake(estimatedWidth, estimatedHeight)
        
        return itemSize
    }
}
