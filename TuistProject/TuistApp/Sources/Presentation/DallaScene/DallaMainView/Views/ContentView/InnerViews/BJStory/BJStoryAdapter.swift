//
//  DallaBJStoryAdapter.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import UIKit

// MARK: BJStoryCollectionView와 MainViewModel간의 Data Binding을 위한 Adapter Class

protocol BJStoryAdapterDataSource: AnyObject {
    var bjStoryItemCount: Int { get }
    var bjStoryRemainingCount: Int? { get }
    
    func getBJStoryItem(at index: Int) -> DallaBJStory
}

protocol BJStoryAdapterDelegate: AnyObject {
//    func didSelectBJStoryItem(item: String)
}

class BJStoryAdapter: NSObject {
    weak var adapterDataSource: BJStoryAdapterDataSource?
    weak var adapterDelegate: BJStoryAdapterDelegate?

    init(collectionView: UICollectionView) {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension BJStoryAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfItems = adapterDataSource?.bjStoryItemCount else { return 0 }
        
        // bjStory 최대 item 갯수가 10개 이므로, item이 10개 이하일 시(bjStoryRemainingCount == nil), item 갯수를 반환한다.
        // item이 10개 초과일 시(bjStoryRemainingCount != nil), 10개의 item + 남은 itemCount를 보여줄 item 갯수를 반환한다.
        if adapterDataSource?.bjStoryRemainingCount != nil {
            let constantCount = DallaConstant.BJStory.defaultCount.constant
            return constantCount
        } else {
            return numberOfItems
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaBJStoryCell", for: indexPath)
                as? DallaBJStoryCell else { return DallaBJStoryCell() }
        guard let bjStoryitem = adapterDataSource?.getBJStoryItem(at: indexPath.row) else { return DallaBJStoryCell() }
        
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        let constantCount = DallaConstant.BJStory.defaultCount.constant
        // item이 10개 초과이며 마지막 indexPath.row일 때, bjStoryRemainingCount를 Cell에 반환
        // 그렇지 않으면, bjStory 데이터 반환
        if let remainingCount = adapterDataSource?.bjStoryRemainingCount, indexPath.row == (constantCount - 1) {
            cell.configureRemainingCount(count: remainingCount)
        } else {
            cell.configure(bjStory: bjStoryitem)
        }
        
        return cell
    }
}

extension BJStoryAdapter: UICollectionViewDelegate {
}

extension BJStoryAdapter: UICollectionViewDelegateFlowLayout {
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
