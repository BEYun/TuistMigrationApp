//
//  DallaMainBannerView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class DallaMainBannerCell: UICollectionViewCell {
    typealias Constraint = DallaMainBannerConstraint
    
    let bjBackgroundImageView = UIImageView()
    let bannerItemWrapperView = UIView()
    let bannerItemBadge = UIImageView()
    
    let bannerItemTitleLabel = UILabel().then {
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.font = UIFont(name: "SUIT-SemiBold", size: 24.0)
        $0.textColor = .black
    }
    
    let bannerItemBJNameLabel = UILabel().then {
        $0.textAlignment = .left
        $0.font = UIFont(name: "SUIT-Regular", size: 14.0)
        $0.textColor = .black
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
    
    // MARK: Init UI Component Methods
    
    private func initUI() {
        // addSubViews
        addSubview(bjBackgroundImageView)
        addSubview(bannerItemWrapperView)
        
        bannerItemWrapperView.addSubview(bannerItemBadge)
        bannerItemWrapperView.addSubview(bannerItemTitleLabel)
        bannerItemWrapperView.addSubview(bannerItemBJNameLabel)
    
        // SnapKit Layout Methods
        setUpBannerItemBJImageView()
        setUpBannerInfoView()
        setUpBannerItemBadge()
        setUpBannerItemTitleLabel()
        setUpBannerItemBJNameLabel()
    }
    
    private func setUpBannerItemBJImageView() {
        bjBackgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUpBannerInfoView() {
        bannerItemWrapperView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.trailing.equalToSuperview()
            $0.height.equalTo(Constraint.infoViewHeight)
        }
    }
    
    private func setUpBannerItemBadge() {
        bannerItemBadge.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(Constraint.infoViewLeading)
            $0.bottom.equalTo(bannerItemTitleLabel.snp.top).offset(-Constraint.itemBadgeBottom)
        }
    }
    
    private func setUpBannerItemTitleLabel() {
        bannerItemTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(Constraint.infoViewLeading)
            $0.bottom.equalTo(bannerItemBJNameLabel.snp.top).offset(-Constraint.itemTitleBottom)
            $0.width.equalToSuperview().multipliedBy(0.63)
        }
    }
    
    private func setUpBannerItemBJNameLabel() {
        bannerItemBJNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(Constraint.infoViewLeading)
            $0.bottom.equalToSuperview().inset(Constraint.bjNameLabelBottom)
        }
    }
    
    // MARK: Custom Methods
    
    // cellForRowAt Delegate Method에 사용되는 Method
    func configure(banner: DallaMainBanner) {
        guard let backgroundImageURL = banner.backgroundImageURL else { return }
        guard let imgURL = URL(string: backgroundImageURL) else { return }
        
        bjBackgroundImageView.kf.setImage(with: imgURL, placeholder: TuistAppAsset.profileNone.image)
        
        if banner.badgeSpecial == 1 {
            bannerItemBadge.image = TuistAppAsset.bdgStar.image
        }
        bannerItemTitleLabel.text = banner.title
        bannerItemBJNameLabel.text = banner.memNick
    }
    
    func setUpGradientLayer() {
        if gradientLayer.frame != bannerItemWrapperView.bounds {
            gradientLayer.frame = bannerItemWrapperView.bounds
            gradientLayer.colors = GradientColor.bannerViewColors
            gradientLayer.locations = [0.0, 0.8, 1]
            bannerItemWrapperView.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
}
