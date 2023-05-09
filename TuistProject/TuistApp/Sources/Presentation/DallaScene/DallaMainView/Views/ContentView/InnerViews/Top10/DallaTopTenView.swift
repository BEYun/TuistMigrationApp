//
//  DallaTopTenWrapperView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class DallaTopTenView: UIView {
    typealias Constraint = DallaTopTenConstraint
    
    let viewModel = TopTenViewModel()
    
    let topTenHeaderView = DallaTopTenHeaderView()
    let topTenScrollView: DallaTopTenScrollView
    let topTenFooterView = DallaTopTenFooterView()

    
    init() {
        self.topTenScrollView = DallaTopTenScrollView(viewModel: viewModel)
        self.topTenHeaderView.delegate = viewModel
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(topTenHeaderView)
        addSubview(topTenScrollView)
        addSubview(topTenFooterView)
        
        // SnapKit Layout Constraints
        setUpTopTenHeaderView()
        setUpTopTenScrollView()
        setUpTopTenFooterView()
    }
    
    private func setUpTopTenHeaderView() {
        topTenHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.headerViewHeight)
        }
    }
    
    private func setUpTopTenScrollView() {
        topTenScrollView.snp.makeConstraints {
            $0.top.equalTo(topTenHeaderView.snp.bottom).offset(Constraint.scrollViewTopOffset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.scrollViewHeight)
        }
    }
    
    private func setUpTopTenFooterView() {
        topTenFooterView.snp.makeConstraints {
            $0.top.equalTo(topTenScrollView.snp.bottom).offset(Constraint.footerViewVerticalOffset)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(DallaTopTenConstraint.footerViewHeight)
        }
    }
}
