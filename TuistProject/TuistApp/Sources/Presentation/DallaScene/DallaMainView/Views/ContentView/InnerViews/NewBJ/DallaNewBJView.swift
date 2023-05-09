//
//  DallaNewBJView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

class DallaNewBJView: UIView {
    typealias Constraint = DallaNewBJViewConstraint
    
    let newBJHeaderView = DallaNewBJHeaderView()

    let newBJScrollView = DallaNewBJScrollView()

    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(newBJHeaderView)
        addSubview(newBJScrollView)
        
        // SnapKit Layout Methods
        setUpNewBJHeaderView()
        setUpNewBJScrollView()
    }
    
    private func setUpNewBJHeaderView() {
        newBJHeaderView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.headerViewHeight)
        }
    }
    
    private func setUpNewBJScrollView() {
        newBJScrollView.snp.makeConstraints {
            $0.top.equalTo(newBJHeaderView.snp.bottom).offset(Constraint.scrollViewTopOffset)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
}
