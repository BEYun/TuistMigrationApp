//
//  DallaTopTenHeaderView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DallaTopTenHeaderView: UIView {
    let topTenTitleButton = UIButton().then {
        $0.setTitle("🏆 NOW TOP 10 >", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.titleLabel?.font = UIFont(name: "SUIT-SemiBold", size: 19)
        $0.titleLabel?.textAlignment = .left
    }
    
    let bjCategoryButton = UIButton().then {
        $0.setTitle("BJ", for: .normal)
        $0.setTitleColor(UIColor.customGray, for: .normal)
        $0.setTitleColor(UIColor.black, for: .selected)
        $0.isSelected = true
        $0.titleLabel?.font = UIFont(name: "SUIT-SemiBold", size: 13)
    }
    
    let fanCategoryButton = UIButton().then {
        $0.setTitle("FAN", for: .normal)
        $0.setTitleColor(UIColor.customGray, for: .normal)
        $0.setTitleColor(UIColor.black, for: .selected)
        $0.titleLabel?.font = UIFont(name: "SUIT-SemiBold", size: 13)
    }
    
    let teamCategoryButton = UIButton().then {
        $0.setTitle("TEAM", for: .normal)
        $0.setTitleColor(UIColor.customGray, for: .normal)
        $0.setTitleColor(UIColor.black, for: .selected)
        $0.titleLabel?.font = UIFont(name: "SUIT-SemiBold", size: 13)
    }
    
    let categoryButtonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        let categoryButtonArray = [bjCategoryButton, fanCategoryButton, teamCategoryButton]
        
        categoryButtonArray.enumerated().forEach { index, button in
            categoryButtonStackView.addArrangedSubview(button)
            if index != categoryButtonArray.count - 1 {
                makeCategoryBorder()
            }
        }
        
        // addSubViews
        addSubview(topTenTitleButton)
        addSubview(categoryButtonStackView)
        
        // SnapKit Layout Methods
        setUpTopTenTitleButton()
        setUpCategoryButtonStackView()
        setUpBJCategoryButton()
    }
    
    private func setUpTopTenTitleButton() {
        topTenTitleButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
        }
    }
    
    private func setUpCategoryButtonStackView() {
        categoryButtonStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
            $0.width.equalTo(140)
        }
    }
    
    private func setUpBJCategoryButton() {
        bjCategoryButton.setTitleColor(UIColor.customGray, for: .normal)
    }
    
    private func makeCategoryBorder() {
        let borderView = UIView().then { $0.backgroundColor = .black }
        
        categoryButtonStackView.addArrangedSubview(borderView)
        
        borderView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(10)
        }
    }
}
