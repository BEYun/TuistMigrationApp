//
//  DallaMainView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit

class DallaMainView: UIView {
    typealias Constraint = DallaMainConstraint
    
    let viewModel: MainBannerViewModel
    
    let headerMenuView = DallaHeaderMenuView()
    let contentView: DallaContentView
    let footerView = DallaFooterView()
    
    init(viewModel: MainBannerViewModel) {
        self.viewModel = viewModel
        self.contentView = DallaContentView(viewModel: viewModel)
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(contentView)
        addSubview(headerMenuView)
        addSubview(footerView)
        
        // SnapKit Layout Methods
        setUpHeaderView()
        setUpContentView()
        setUpFooterView()
    }
    
    
    private func setUpHeaderView() {
        headerMenuView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(Constraint.headerViewHeight)
        }
    }
    
    private func setUpContentView() {
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(footerView.snp.top)
        }
        
        // 스크롤 인셋 제거
        contentView.contentInsetAdjustmentBehavior = .never
    }
    
    private func setUpFooterView() {
        footerView.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.footerViewHeight)
        }
    }
    
    deinit {
        print("DallaMainView Deinit")
    }
}
