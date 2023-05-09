//
//  DallaFooterView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

protocol PlusButtonDelegate: AnyObject {
    func plusButtonTapped()
}

class DallaFooterView: UIView {
    
    typealias Constraint = DallaFooterConstraint

    let liveButton = UIButton().then {
        $0.setImage(TuistAppAsset.footerLive.image, for: .normal)
    }
    
    let clipButton = UIButton().then {
        $0.setImage(TuistAppAsset.footerClipD.image, for: .normal)
    }
    
    let plusButton = UIButton().then {
        $0.setImage(TuistAppAsset.footerPlus.image, for: .normal)
    }
    
    let searchButton = UIButton().then {
        $0.setImage(TuistAppAsset.footerSearchD.image, for: .normal)
    }
    
    let myButton = UIButton().then {
        $0.setImage(TuistAppAsset.footerMyD.image, for: .normal)
    }
    
    let footerStackView = UIStackView().then {
        $0.distribution = .equalSpacing
    }
    
    weak var delegate: PlusButtonDelegate?
    
    private func initUI() {
        backgroundColor = .white
        
        let buttonArray = [liveButton, clipButton, plusButton, searchButton, myButton]
        
        // addSubViews
        addSubview(footerStackView)
        buttonArray.forEach { button in
            footerStackView.addArrangedSubview(button)
        }
        
        // SnapKit Layout Methods
        setUpLiveButton()
        setUpClipButton()
        setUpPlusButton()
        setUpSearchButton()
        setUpMyButton()
        setUpFooterStackView()
    }
    
    private func setUpFooterStackView() {
        footerStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Constraint.footerStackVertical)
            $0.leading.trailing.equalToSuperview().inset(Constraint.footerStackHorizontal)
        }
    }
    
    private func setUpLiveButton() {
        liveButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.footerButtonSize)
        }
    }
    
    private func setUpClipButton() {
        clipButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.footerButtonSize)
        }
    }
    
    private func setUpPlusButton() {
        plusButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.footerButtonSize)
        }
        
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
    }
    
    private func setUpSearchButton() {
        searchButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.footerButtonSize)
        }
    }
    
    private func setUpMyButton() {
        myButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.footerButtonSize)
        }
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}

extension DallaFooterView {
    @objc
    private func plusButtonTapped() {
        delegate?.plusButtonTapped()
    }
}
