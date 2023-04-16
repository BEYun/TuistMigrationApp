//
//  DallaMainView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit

class DallaMainView: UIView {
    let dallaHeaderMenu = DallaHeaderMenu()
    
    private func initUI() {
        addSubview(dallaHeaderMenu)
        dallaHeaderMenu.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DallaMainView Deinit")
    }
}
