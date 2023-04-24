//
//  DallaADBannerCell.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/24.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class DallaADBannerCell: UICollectionViewCell {
    let adImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(adImageView)
        
        // SnapKit Layout Methods
        setUpADImageView()
    }
    
    private func setUpADImageView() {
        adImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(banner: DallaADBanner) {
        guard let image = banner.adImage else { return }
        adImageView.image = image
    }
}
