//
//  DallaContentView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DallaContentView: UIScrollView {
    let stackView = UIStackView().then {
        $0.axis = .vertical
    }
    let mainBannerCollectionView = DallaMainBannerCollectionView()
    let bjStoryCollectionView = DallaBJStoryCollectionView()
    let topTenHeaderView = DallaTopTenHeaderView()
    let view4 = UIView().then {
        $0.backgroundColor = .green
    }
    let view5 = UIView().then {
        $0.backgroundColor = .blue
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        let viewArray = [mainBannerCollectionView, bjStoryCollectionView, topTenHeaderView, view4, view5]
        
        // addSubViews
        viewArray.forEach { view in
            stackView.addArrangedSubview(view)
        }
        addSubview(stackView)
        
        // SnapKit Layout Methods
        setUpViews()
    }
    
    private func setUpViews() {
        stackView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.edges.equalToSuperview()
        }
        
        mainBannerCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(stackView.snp.width)
        }
        
        bjStoryCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(mainBannerCollectionView.snp.bottom)
            $0.height.equalTo(120)
        }
        
        topTenHeaderView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(bjStoryCollectionView.snp.bottom)
            $0.height.equalTo(26)
        }
        
        view4.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topTenHeaderView.snp.bottom)
            $0.height.equalTo(200)
        }
        
        view5.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view4.snp.bottom)
            $0.height.equalTo(200)
            $0.bottom.equalToSuperview()
        }
    }
}
