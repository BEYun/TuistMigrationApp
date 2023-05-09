//
//  DallaContentView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

class DallaContentView: UIScrollView {
    typealias Constraint = DallaContentViewConstraint
    
    let viewModel: MainBannerViewModel

    let contentStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
    }
    
    let mainBannerCollectionView: DallaMainBannerCollectionView
    let bjStoryCollectionView = DallaBJStoryCollectionView()
    let topTenView = DallaTopTenView()
    let newBJView = DallaNewBJView()
    let eventBannerCollectionView = DallaEventBannerCollectionView()
    let liveView = DallaLiveRoomView()
    
    init(viewModel: MainBannerViewModel) {
        self.viewModel = viewModel
        self.mainBannerCollectionView = DallaMainBannerCollectionView(viewModel: viewModel)
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func initUI() {
        let viewArray = [mainBannerCollectionView, bjStoryCollectionView, topTenView, newBJView, eventBannerCollectionView, liveView]
        
        addSubview(contentStackView)
        
        // addSubViews
        viewArray.forEach { view in
            contentStackView.addArrangedSubview(view)
        }
        
        // SnapKit Layout Methods
        setUpContentStackView()
        setUpMainBannerCollectionView()
        setUpBJStoryCollectionView()
        setUpTopTenView()
        setUpNewBJView()
        setUpEventBannerCollectionView()
        setUpLiveView()
    }
    
    private func setUpContentStackView() {
        contentStackView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUpMainBannerCollectionView() {
        mainBannerCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.mainBannerViewHeight)
        }
    }
    
    private func setUpBJStoryCollectionView() {
        bjStoryCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(mainBannerCollectionView.snp.bottom)
            $0.height.equalTo(Constraint.bjStoryViewHeight)
        }
    }
    
    private func setUpTopTenView() {
        topTenView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(bjStoryCollectionView.snp.bottom)
            $0.height.equalTo(Constraint.topTenViewHeight + Constraint.topTenOffset)
        }
    }
    
    private func setUpNewBJView() {
        newBJView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topTenView.snp.bottom)
            $0.height.equalTo(Constraint.newBJViewHeight + Constraint.newBJTopOffset)
        }
    }
    private func setUpEventBannerCollectionView() {
        eventBannerCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(newBJView.snp.bottom)
            $0.height.equalTo(Constraint.adBannerHeight + Constraint.adBannerTopOffset)
        }
    }
    
    private func setUpLiveView() {
        liveView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(eventBannerCollectionView.snp.bottom)
            $0.height.equalTo(((DallaLiveRoomConstraint.cellHeight + DallaLiveRoomConstraint.lineSpacing) * 30)
                              + DallaLiveRoomConstraint.totalHeaderViewHeight)
        }
    }
    
    deinit {
        print("DallaContentView Deinit")
    }
}
