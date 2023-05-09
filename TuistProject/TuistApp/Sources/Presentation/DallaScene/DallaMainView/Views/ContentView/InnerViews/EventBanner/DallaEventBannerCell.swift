//
//  DallaEventBannerCell.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/24.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class DallaEventBannerCell: UICollectionViewCell {
    let eventBannerImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(eventBannerImageView)
        
        // SnapKit Layout Methods
        setUpEventBannerImageView()
    }
    
    private func setUpEventBannerImageView() {
        eventBannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(banner: DallaEventBanner) {
        guard let imgURL = URL(string: banner.bannerURL) else { return }
        
        eventBannerImageView.kf.setImage(with: imgURL, placeholder: TuistAppAsset.profileNone.image)
    }
}
