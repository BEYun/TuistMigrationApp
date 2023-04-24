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

    let collectionViewFlowLayout = UICollectionViewFlowLayout().then({
        $0.scrollDirection = .horizontal
        $0.minimumInteritemSpacing = 12
    })
    
    init() {
        super.init(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        setUpBJStoryCollectionView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpBJStoryCollectionView() {
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentInset = Constraint.bjStoryCollectionViewInsets
        self.backgroundColor = .clear
        self.clipsToBounds = true
        self.register(DallaBJStoryCell.self, forCellWithReuseIdentifier: "DallaBJStoryCell")
    }
}
