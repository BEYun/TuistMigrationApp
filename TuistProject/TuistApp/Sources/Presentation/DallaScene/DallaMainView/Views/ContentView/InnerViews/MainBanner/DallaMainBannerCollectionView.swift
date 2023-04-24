//
//  DallaMainBannerView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then

class DallaMainBannerCollectionView: UICollectionView {
    typealias Constraint = DallaMainBannerConstraint
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout().then({
        $0.scrollDirection = .horizontal
        $0.itemSize = .init(width: Constraint.mainCellSize, height: Constraint.mainCellSize)
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
    })
    
    init() {
        super.init(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        setUpMainBannerCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpMainBannerCollectionView() {
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentInset = .zero
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.register(DallaMainBannerCell.self, forCellWithReuseIdentifier: "DallaMainBannerCell")
        self.isPagingEnabled = true
    }
}
