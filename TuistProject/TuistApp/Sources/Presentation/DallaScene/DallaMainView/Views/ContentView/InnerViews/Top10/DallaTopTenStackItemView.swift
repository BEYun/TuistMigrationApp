//
//  DallaTopTenStackItemView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/20.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class DallaTopTenStackItemView: UIView {
    // TOP 10 Stack의 item
    let profileImageView = UIImageView()
    let liveButton = UIButton()
    let rankingImageView = UIImageView()
    let profileInnerNameLabel = UILabel()
    
    let profileONameLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(profileImageView)
        addSubview(profileONameLabel)
        profileImageView.addSubview(liveButton)
        profileImageView.addSubview(rankingImageView)
        profileImageView.addSubview(profileInnerNameLabel)
        
        // SnapKit Layout Methods
    }
    
    
}
