//
//  DallaNewBJScrollView.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/24.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then

class DallaNewBJScrollView: UIScrollView {
    let viewModel: DallaMainViewModel
    
    let newBJStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    init(viewModel: DallaMainViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initUI() {
        // addSubViews
        addSubview(newBJStackView)
        
        // SnapKit Layout Methods
        setUpNewBJStackView()
        makeStackViewItem()
    }

    private func setUpNewBJStackView() {
        newBJStackView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
            $0.height.equalToSuperview()
        }
    }
    
    private func makeStackViewItem() {
        viewModel.newBJList.enumerated().forEach { (index, data) in
            let newBJStackViewItem = DallaBJStackViewItem()
            
            newBJStackViewItemBinding(item: newBJStackViewItem, data: data)
            newBJStackView.addArrangedSubview(newBJStackViewItem)
            // SnapKit Layout
            setUpStackViewItem(item: newBJStackViewItem)
        }
    }
    
    private func newBJStackViewItemBinding(item: DallaBJStackViewItem, data: DallaTopTenModel) {
        item.profileImageView.image = data.profileImage
        item.profileInnerNameLabel.text = data.memNick
        
        item.profileInnerNameLabel.isHidden = false
        item.profileNameLabel.isHidden = true
        item.liveButton.isHidden = true
        item.rankingImageView.isHidden = true
    }
    
    private func setUpStackViewItem(item: DallaBJStackViewItem) {
        item.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
    }
    
}
