//
//  DallaHeaderMenu.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DallaHeaderMenu: UIView {
    typealias Constraint = DallaMainConstraint

    let dallaLogoButton = UIButton().then {
        $0.setImage(UIImage(named: "dalla_logo"), for: .normal)
    }
    
    let storeButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_store_w"), for: .normal)
    }
    
    let rankingButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_ranking_w"), for: .normal)
    }
    
    let messageButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_message_w"), for: .normal)
    }
    
    let alarmButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_alarm_w"), for: .normal)
    }
    
    lazy var headerStackView = UIStackView()
    
    private func initUI() {
        // addSubViews Methods
        let headerButtonArray = [storeButton, rankingButton, messageButton, alarmButton]
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
        dallaLogoButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constraint.defaultLeading)
            make.centerY.equalToSuperview()
        }
    }
    
    private func setUpStoreButton() {
        storeButton.snp.makeConstraints { make in
            make.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpRankingButton() {
        rankingButton.snp.makeConstraints { make in
            make.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpMessageButton() {
        messageButton.snp.makeConstraints { make in
            make.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpAlarmButton() {
        alarmButton.snp.makeConstraints { make in
            make.width.height.equalTo(Constraint.headerButtonSize)
        }
    }
    
    private func setUpHeaderStackView() {
        headerStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraint.headerStackVertical)
            make.trailing.equalToSuperview().inset(Constraint.headerStackTrailing)
        }
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DallaHeaderMenu Deinit")
    }
    
}