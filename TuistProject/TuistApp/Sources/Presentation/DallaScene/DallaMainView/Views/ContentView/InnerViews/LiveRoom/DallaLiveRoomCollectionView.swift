//
//  DallaLiveCollectionView.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class DallaLiveRoomCollectionView: UICollectionView {
    typealias Constraint = DallaLiveRoomConstraint
    
    let viewModel: LiveRoomViewModel
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = Constraint.lineSpacing
        $0.minimumInteritemSpacing = 0
    }
    
    init(viewModel: LiveRoomViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        setUpCollectionView()
        fetchLiveRoomList()
        setDataBinding()
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
        self.register(DallaLiveRoomCollectionViewCell.self, forCellWithReuseIdentifier: "DallaLiveRoomCollectionViewCell")
        self.isPagingEnabled = true
    }
    
    private func fetchLiveRoomList() {
        viewModel.fetchLiveRoomList {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    private func setDataBinding() {
        viewModel.liveRoomList.bind { _ in
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
}

extension DallaLiveRoomCollectionView: UICollectionViewDelegate {
    
}

extension DallaLiveRoomCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.liveItemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DallaLiveRoomCollectionViewCell", for: indexPath)
                as? DallaLiveRoomCollectionViewCell,
                let item = viewModel.getLiveRoomListItem(at: indexPath.row) else { return DallaLiveRoomCollectionViewCell() }
        
        cell.configure(item: item)
        
        return cell
    }
}

extension DallaLiveRoomCollectionView: UICollectionViewDelegateFlowLayout {
    // cell의 itemSize 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let estimatedWidth = Constraint.cellWidth
        let estimatedHeight = Constraint.cellHeight
        
        let itemSize = CGSizeMake(estimatedWidth, estimatedHeight)
        return itemSize
    }
}
