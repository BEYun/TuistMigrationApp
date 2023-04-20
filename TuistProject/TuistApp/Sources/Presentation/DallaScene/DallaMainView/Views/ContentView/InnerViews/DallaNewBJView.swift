//
//  DallaNewBJView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DallaNewBJView: UIView {

    let checklabel = UILabel().then {
        
        $0.text = "New BJ View"
        $0.backgroundColor = .gray
        
    }

    private func initUI() {
        
        addSubview(checklabel)
        
    }
}
