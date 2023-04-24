//
//  DallaNewBJHeaderView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/24.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then

class DallaNewBJHeaderView: UIView {
    let headerTitleLabel = UILabel().then {
        $0.text = "🌱 NEW BJ"
        $0.textAlignment = .left
        $0.font = UIFont(name: "SUIT-SemiBold", size: 19.0)
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(headerTitleLabel)
        
        // SnapKit Layout Methods
        setUpHeaderTitleLabel()
    }
    
    private func setUpHeaderTitleLabel() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
        }
        headerTitleLabel.textColor = UIColor.blackFontColor
    }
}
