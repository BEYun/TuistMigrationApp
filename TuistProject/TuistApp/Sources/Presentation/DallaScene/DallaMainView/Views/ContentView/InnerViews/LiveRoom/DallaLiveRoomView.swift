//
//  DallaLiveView.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit

class DallaLiveRoomView: UIView {
    typealias Constraint = DallaLiveRoomConstraint
    
    let viewModel = LiveRoomViewModel()
    
    let liveRoomHeader = DallaLiveRoomHeaderView()
    let liveRoomCollectionView: DallaLiveRoomCollectionView
    
    init() {
        liveRoomHeader.delegate = viewModel
        liveRoomCollectionView = DallaLiveRoomCollectionView(viewModel: viewModel)
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(liveRoomHeader)
        addSubview(liveRoomCollectionView)
        
        // SnapKit Layout Methods
        setUpLiveRoomHeader()
        setUpLiveRoomCollectionView()
    }
    
    private func setUpLiveRoomHeader() {
        liveRoomHeader.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.headerHeight)
        }
    }
    
    private func setUpLiveRoomCollectionView() {
        liveRoomCollectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(liveRoomHeader.snp.bottom).offset(Constraint.collectionViewOffset)
        }
    }
    
    deinit {
        print("DallaLiveView Deinit")
    }
}
