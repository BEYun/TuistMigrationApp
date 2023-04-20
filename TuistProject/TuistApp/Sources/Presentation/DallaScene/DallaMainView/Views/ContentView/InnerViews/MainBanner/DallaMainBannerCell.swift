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
        $0.text = "하늘 닮은 DJ 늘 사랑 받는 아침방송"
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.font = UIFont(name: "SUIT-SemiBold", size: 24.0)
        $0.textColor = .black
    }
    
    let bannerItemBJNameLabel = UILabel().then {
        $0.text = "애 나𝒜𝓃𝓃𝒶 📻 🎧"
        $0.textAlignment = .left
        $0.font = UIFont(name: "SUIT-Regular", size: 14.0)
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        prepare()
    }
    
    // 셀 재사용을 위한 초기화
    private func prepare() {
        bjBackgroundImageView.image = nil
        bannerItemBadge.image = nil
        bannerItemTitleLabel.text = nil
        bannerItemBJNameLabel.text = nil
    }
    
    // cellForRowAt Delegate Method에 사용되는
    func configure(bannerList: DallaBannerList) {
        guard let backgroundImageURL = bannerList.backgroundImageURL else { return }
        guard let imgURL = URL(string: backgroundImageURL) else { return }
        
        bjBackgroundImageView.kf.setImage(with: imgURL)
        
        if bannerList.badgeSpecial == 1 {
            bannerItemBadge.image = UIImage(named: "bdg_star")
        }
        bannerItemTitleLabel.text = bannerList.title
        bannerItemBJNameLabel.text = bannerList.memNick
    }

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
            $0.height.equalToSuperview().multipliedBy(0.4)
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

}
