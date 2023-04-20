//
//  DallaBJStoryCell.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/19.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import Then
import SnapKit

class DallaBJStoryCell: UICollectionViewCell {
    typealias Constraint = DallaBJStoryConstraint

    let storyButton = UIButton().then {
        $0.backgroundColor = .gray
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    let buttonBackgroundView = UIView().then {
        $0.backgroundColor = .systemPink
    }
    
    let bjNameLabel = UILabel().then {
        $0.font = UIFont(name: "SUIT-Regular", size: 12.0)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare(nil)
    }
    
    func prepare(_ string: String?) {
        bjNameLabel.text = string
    }
    
    private func initUI() {
        // addSubViews
        addSubview(buttonBackgroundView)
        addSubview(bjNameLabel)
        buttonBackgroundView.addSubview(storyButton)
        
        // SnapKit Layout Methods
        setUpbuttonBackgroundView()
        setUpStoryButton()
        setUpBJNameLabel()
    }
    
    private func setUpStoryButton() {
        storyButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(Constraint.bjStoryButtonSize)
        }
        
        storyButton.layer.cornerRadius = Constraint.bjStoryButtonSize / 2
    }
    
    private func setUpbuttonBackgroundView() {
        buttonBackgroundView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(Constraint.backgroundViewSize)
        }
        
        buttonBackgroundView.layer.cornerRadius = Constraint.backgroundViewSize / 2
    }
    
    private func setUpBJNameLabel() {
        bjNameLabel.snp.makeConstraints {
            $0.top.equalTo(buttonBackgroundView.snp.bottom)
            $0.centerX.equalTo(buttonBackgroundView)
            $0.bottom.equalToSuperview()
        }
    }
}
