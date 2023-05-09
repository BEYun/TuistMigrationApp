//
//  DallaHeaderMenuView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

enum ButtonColor {
    case white
    case black
}

class DallaHeaderMenuView: UIView {
    typealias Constraint = DallaHeaderConstraint
    
    let dallaLogoButton = UIButton().then {
        $0.setImage(TuistAppAsset.dallaLogo.image, for: .normal)
        $0.alpha = 0
    }
    let storeButton = UIButton().then {
        $0.setImage(TuistAppAsset.btnStoreW.image, for: .normal)
    }
    let rankingButton = UIButton().then {
        $0.setImage(TuistAppAsset.btnRankingW.image, for: .normal)
    }
    let messageButton = UIButton().then {
        $0.setImage(TuistAppAsset.btnMessageW.image, for: .normal)
    }
    let alarmButton = UIButton().then {
        $0.setImage(TuistAppAsset.btnAlarmW.image, for: .normal)
    }
    lazy var headerStackView = UIStackView()
    lazy var headerButtonArray = [storeButton, rankingButton, messageButton, alarmButton]
    
    var buttonColorState: ButtonColor = .white
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        backgroundColor = UIColor.white.withAlphaComponent(0)
        
        // addSubViews Methods
        headerButtonArray.forEach { button in
            headerStackView.addArrangedSubview(button)
        }
        
        addSubview(dallaLogoButton)
        addSubview(headerStackView)
        
        // Constraints Methods
        setUpDallaLogoButton()
        setUpStoreButton()
        setUpRankingButton()
        setUpMessageButton()
        setUpAlarmButton()
        setUpHeaderStackView()
    }
    
    private func setUpDallaLogoButton() {
        dallaLogoButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
            $0.centerY.equalTo(headerStackView)
        }
    }
    
    private func setUpStoreButton() {
        storeButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpRankingButton() {
        rankingButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpMessageButton() {
        messageButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpAlarmButton() {
        alarmButton.snp.makeConstraints {
            $0.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpHeaderStackView() {
        headerStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(Constraint.headerStackVerticalInset)
            $0.trailing.equalToSuperview().inset(Constraint.headerStackTrailingInset)
            $0.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    func toggleBackgroundColor(offsetY: CGFloat, minOffset: CGFloat, maxOffset: CGFloat) {
        guard let headerBackgroundColor = self.backgroundColor else { return }
        
        var alpha = headerBackgroundColor.cgColor.alpha
        
        // 중복 호출 방지
        if offsetY < minOffset && alpha == 0 {
            return
        }
        if offsetY > maxOffset && alpha == 1 {
            return
        }
        
        if offsetY < minOffset {
            alpha = 0
        } else if offsetY > maxOffset {
            alpha = 1
        } else {
            alpha = (offsetY - minOffset) / (maxOffset - minOffset)
        }
        
        self.backgroundColor = UIColor.white.withAlphaComponent(alpha)
        self.dallaLogoButton.alpha = alpha
        toggleButtonImage(alpha: alpha)
    }
    
    func toggleButtonImage(alpha: CGFloat) {
        if alpha == 1 && buttonColorState == .white {
            buttonColorState = .black
            storeButton.setImage(TuistAppAsset.btnStoreB.image, for: .normal)
            rankingButton.setImage(TuistAppAsset.btnRankingB.image, for: .normal)
            messageButton.setImage(TuistAppAsset.btnMessageB.image, for: .normal)
            alarmButton.setImage(TuistAppAsset.btnAlarmB.image, for: .normal)
        } else if alpha < 1 && buttonColorState == .black {
            buttonColorState = .white
            storeButton.setImage(TuistAppAsset.btnStoreW.image, for: .normal)
            rankingButton.setImage(TuistAppAsset.btnRankingW.image, for: .normal)
            messageButton.setImage(TuistAppAsset.btnMessageW.image, for: .normal)
            alarmButton.setImage(TuistAppAsset.btnAlarmW.image, for: .normal)
        }
    }
    
    deinit {
        print("DallaHeaderMenu Deinit")
    }
    
}
