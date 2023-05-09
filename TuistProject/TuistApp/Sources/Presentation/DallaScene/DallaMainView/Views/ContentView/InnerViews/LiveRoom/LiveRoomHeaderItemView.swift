//
//  DallaLiveHeaderButtonItemView.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then
import SnapKit

class LiveRoomHeaderItemView: UIView {
    let titleButton = UIButton().then {
        $0.titleLabel?.font = TuistAppFontFamily.Suit.bold.font(size: 16.0)
        $0.setTitleColor(UIColor.blackFontColor, for: .selected)
        $0.setTitleColor(UIColor.grayFontColor, for: .normal)
        $0.isUserInteractionEnabled = false
    }
    
    let selectedStatusBar = UIView().then {
        $0.backgroundColor = UIColor.DallaActiveBackgroundColor
        $0.isHidden = true
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.titleButton.setTitle(title, for: .normal)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addSubViews
        addSubview(titleButton)
        addSubview(selectedStatusBar)
        
        // SnapKit Layout Methods
        setUpTitleButton()
        setUpSelectedStatusBar()
    }
    
    private func setUpTitleButton() {
        titleButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setUpSelectedStatusBar() {
        selectedStatusBar.snp.makeConstraints {
            $0.bottom.equalTo(titleButton.snp.bottom).offset(-5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(30)
            $0.height.equalTo(5)
        }
        
        selectedStatusBar.layer.cornerRadius = 2.5
    }
    
    deinit {
        print("DallaLiveHeaderButtonItemView Deinit")
    }
}
