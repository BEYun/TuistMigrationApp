//
//  DallaBJStoryAdapter.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation
import UIKit

protocol BJStoryAdapterDataSource: AnyObject {
    var bjStoryItemCount: Int { get }
    
    func getBJStoryItem(at index: Int) -> String
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
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaBJStoryCell", for: indexPath)
                as? DallaBJStoryCell else { return DallaBJStoryCell() }
        
        let item = adapterDataSource?.getBJStoryItem(at: indexPath.row)
        cell.prepare(item)
        
        return cell
    }
}

extension BJStoryAdapter: UICollectionViewDelegate {}
