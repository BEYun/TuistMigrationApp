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
import Kingfisher

class DallaBJStoryCell: UICollectionViewCell {
    typealias Constraint = DallaBJStoryConstraint

    let mainBackgroundView = UIView()
    
    let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    let remainingCountWrapperView = UIView().then {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        $0.isHidden = true
    }
    
    let remainingCountLabel = UILabel().then {
        $0.font = UIFont(name: "SUIT-Bold", size: 20.0)
        $0.textAlignment = .center
        
    }
    
    let bjNameLabel = UILabel().then {
        $0.font = UIFont(name: "SUIT-Regular", size: 12.0)
        $0.textAlignment = .center
        $0.text = ""
    }
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpGradientLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare()
    }
    
    // 컴포넌트 상태 초기화
    func prepare() {
        profileImageView.isHidden = false
        remainingCountWrapperView.isHidden = true
        bjNameLabel.isHidden = false
    }
    
    // MARK: Init Component Methods
    
    private func initUI() {
        // addSubViews
        addSubview(mainBackgroundView)
        addSubview(bjNameLabel)
        mainBackgroundView.addSubview(profileImageView)
        mainBackgroundView.addSubview(remainingCountWrapperView)
        remainingCountWrapperView.addSubview(remainingCountLabel)
        
        // SnapKit Layout Methods
        setUpMainBackgroundView()
        setUpBJNameLabel()
        setUpProfileImageView()
        setUpRemainingCountWrapperView()
        setUpRemainingCountLabel()
    }
    
    private func setUpMainBackgroundView() {
        mainBackgroundView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(Constraint.backgroundViewSize)
        }
        
        mainBackgroundView.layer.cornerRadius = Constraint.backgroundViewSize / 2
    }
    
    private func setUpBJNameLabel() {
        bjNameLabel.snp.makeConstraints {
            $0.top.equalTo(mainBackgroundView.snp.bottom)
            $0.centerX.equalTo(mainBackgroundView)
            $0.bottom.equalToSuperview()
        }
        bjNameLabel.textColor = UIColor.secondBlackFontColor
    }
        
    private func setUpProfileImageView() {
        profileImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(Constraint.profileImageViewSize)
        }
        
        profileImageView.layer.cornerRadius = Constraint.profileImageViewSize / 2
    }
    
    private func setUpRemainingCountWrapperView() {
        remainingCountWrapperView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(Constraint.profileImageViewSize)
        }
        
        remainingCountWrapperView.layer.cornerRadius = Constraint.profileImageViewSize / 2
        remainingCountWrapperView.backgroundColor = UIColor.grayBackgroundColor
    }
    
    private func setUpRemainingCountLabel() {
        remainingCountLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
        remainingCountLabel.textColor = UIColor.grayFontColor
        remainingCountLabel.sizeToFit()
    }
    
    //MARK: Custom Methods
    
    // cell에 필요한 데이터 바인딩 메소드
    func configure(bjStory: DallaBJStory) {
        guard let profileImageURL = bjStory.profileImageUrl else { return }
        guard let imgURL = URL(string: profileImageURL) else { return }
        
        profileImageView.kf.setImage(with: imgURL, placeholder: TuistAppAsset.profileNone.image)
        bjNameLabel.text = bjStory.memNick
        
        addGradientColor(roomYn: bjStory.roomYn)
    }

    func configureRemainingCount(count: Int) {
        profileImageView.isHidden = true
        remainingCountWrapperView.isHidden = false
        remainingCountLabel.text = "+" + String(count)
        
        gradientLayer.colors = nil
        bjNameLabel.isHidden = true
    }

    private func addGradientColor(roomYn: String) {
        if roomYn == "n" {
            gradientLayer.colors = GradientColor.deactivatedColors
        } else {
            gradientLayer.colors = GradientColor.activatedColors
        }
    }
    
    private func setUpGradientLayer() {
        if gradientLayer.frame != mainBackgroundView.bounds {
            gradientLayer.frame = mainBackgroundView.bounds
            gradientLayer.cornerRadius = mainBackgroundView.bounds.width / 2
            mainBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
