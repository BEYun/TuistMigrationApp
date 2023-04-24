//
//  DallaTopTenFooterView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then

class DallaTopTenFooterView: UIView {
    typealias Constraint = DallaTopTenFooterViewConstraint
    
    let footerWrapperView = UIView()

    let tipImageView = UIImageView().then {
        $0.image = UIImage(named: "img_tip")
    }
    let contentLabel = UILabel().then {
        $0.text = "타임랭킹 1~3위시, 스타DJ 가산점 지급"
        $0.font = UIFont(name: "SUIT-Medium", size: 13.0)
        $0.textAlignment = .left
    }
    let dropDownButton = UIButton().then {
        $0.setImage(UIImage(named: "ico_drop down"), for: .normal)
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
        addSubview(footerWrapperView)
        footerWrapperView.addSubview(tipImageView)
        footerWrapperView.addSubview(contentLabel)
        footerWrapperView.addSubview(dropDownButton)
        
        // Snapkit Layout Methods
        setUpFooterWrapperView()
        setUpTipImageView()
        setUpContentLabel()
        setUpdropDownButton()
    }

    private func setUpFooterWrapperView() {
        footerWrapperView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
        }
        footerWrapperView.backgroundColor = UIColor.topTenFooterBackgroundColor
        footerWrapperView.layer.cornerRadius = DallaTopTenConstraint.footerViewHeight / 2
    }
    
    private func setUpTipImageView() {
        tipImageView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.equalTo(Constraint.tipImageWidth)
            $0.height.equalTo(Constraint.tipImageHeight)
        }
    }
    
    private func setUpContentLabel() {
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(tipImageView.snp.trailing).offset(Constraint.contentLabelLeadingOffset)
            $0.top.bottom.equalToSuperview().inset(Constraint.contentLabelVerticalInset)
        }
        contentLabel.textColor = UIColor.secondBlackFontColor
        
        guard let text = contentLabel.text else { return }
        let attributeString = NSMutableAttributedString(string: text)
        let boldFont = UIFont(name: "SUIT-Bold", size: 13.0) ?? UIFont.systemFont(ofSize: 13.0)
        let boldText = ["1~3위", "스타DJ", "가산점"]
        
        for text in boldText {
            let range = (text as NSString).range(of: text)
            attributeString.addAttribute(.font, value: boldFont, range: range)
        }
        
        contentLabel.attributedText = attributeString
        contentLabel.sizeToFit()
    }
    
    private func setUpdropDownButton() {
        dropDownButton.snp.makeConstraints {
            $0.centerY.equalTo(tipImageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(Constraint.dropButtonTrailingInset)
            $0.width.height.equalTo(Constraint.dropButtonSize)
        }
    }
}
