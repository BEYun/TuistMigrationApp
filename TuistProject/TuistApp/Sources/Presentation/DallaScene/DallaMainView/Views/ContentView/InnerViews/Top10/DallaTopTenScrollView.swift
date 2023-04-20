//
//  DallaTopTenScrollView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit
import Then

class DallaTopTenScrollView: UIScrollView {
    let topTenStackView = UIStackView().then {
        $0.axis = .horizontal
    }
    
    let topTenStackItemView = DallaTopTenStackItemView()
    

    private func initUI() {
        
    }

}

class ProfileView: UIView {
    var model: SomeModel!
    
    init(model: SomeModel) {
        self.model = model
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var profileView = UIImageView(image: model.image!)
    
    lazy var nameLabel = UILabel().then {
        $0.text = model.name
    }
    
    private func commonInit() {
        addComponents()
        setConstraints()
    }
    
    private func addComponents() {
        addSubview(profileView)
    }
    
    private func setConstraints() {}
    
    private func test() {
        let profileViewTapped = UITapGestureRecognizer(target: self, action: #selector(profileViewTapAction))
    }
    
    @objc
    func profileViewTapAction() {
        print(model.profileUrl)
    }
}

struct SomeModel {
    let profileUrl: String
    let name: String
    let state: SomeState
    let ranking: Int?
    
    var image: UIImage? {
        UIImage(named: profileUrl)
    }
}

enum SomeState {
    case normal
    case live
    case listen
}
