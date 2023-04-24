//
//  DallaBJStackViewItem.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then

class DallaBJStackViewItem: UIStackView {
    typealias Constraint = DallaBJStackViewItemConstraint
    
    let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    let liveButton = UIButton()
    let rankingImageView = UIImageView()
    let profileInnerNameLabel = UILabel().then {
        $0.font = UIFont(name: "SUIT-Medium", size: 13.0)
        $0.textColor = .white
        $0.textAlignment = .left
        $0.isHidden = true
    }
    let profileNameLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansCJKkr-Regular", size: 15.0)
        $0.textColor = UIColor.secondBlackFontColor
        $0.textAlignment = .center
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // StackView Init
        self.axis = .vertical
        self.distribution = .equalCentering
        self.spacing = Constraint.itemSpacing
        
        // addSubViews
        addArrangedSubview(profileImageView)
        addArrangedSubview(profileNameLabel)
        profileImageView.addSubview(liveButton)
        profileImageView.addSubview(rankingImageView)
        profileImageView.addSubview(profileInnerNameLabel)
        
        // SnapKit Layout Methods
        setUpProfileImageView()
        setUpProfileNameLabel()
        setUpLiveButton()
        setUpRankingImageView()
        setUpProfileInnerNameLabel()
    }
    
    private func setUpProfileImageView() {
        profileImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(Constraint.profileViewWidth)
            $0.height.equalTo(Constraint.profileViewHeight)
        }
        
        profileImageView.layer.cornerRadius = 8
        profileImageView.backgroundColor = UIColor.topTenProfileBackgroundColor
    }
    
    private func setUpProfileNameLabel() {
        profileNameLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
        }
        profileNameLabel.sizeToFit()
    }
    
    private func setUpLiveButton() {
        liveButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(Constraint.liveButtonSize)
        }
    }
    
    private func setUpRankingImageView() {
        rankingImageView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.width.equalTo(Constraint.rankingNubmerWidth)
            $0.height.equalTo(Constraint.rankingNumberHeight)
        }
    }
    
    private func setUpProfileInnerNameLabel() {
        profileInnerNameLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(Constraint.profileInnerNameLabelInset)
        }
        profileInnerNameLabel.textColor = UIColor.secondBlackFontColor
    }
}
