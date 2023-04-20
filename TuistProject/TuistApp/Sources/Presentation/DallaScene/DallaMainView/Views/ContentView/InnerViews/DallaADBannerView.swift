//
//  DallaADBannerView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DallaADBannerView: UIView {

    let checklabel = UILabel().then {
        
        $0.text = "AD Banner View"
        $0.backgroundColor = .green
        
    }
    
    private func initUI() {
        
        addSubview(checklabel)
        
    }

}
