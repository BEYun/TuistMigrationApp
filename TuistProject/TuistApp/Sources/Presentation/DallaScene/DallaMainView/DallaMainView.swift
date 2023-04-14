//
//  DallaMainView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class DallaMainView: UIView {
    let mainScrollView = UIScrollView()
    let mainView = UIView().then {
        $0.backgroundColor = .yellow
    }
    let checkLabel = UILabel().then {
        $0.text = "확인중"
        $0.textColor = .red
    }
    
    private func initUI() {
        addSubview(checkLabel)
        checkLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
