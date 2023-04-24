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
    
    let viewModel: DallaMainViewModel
    
    let bjStackView = UIStackView().then {
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
        // addSubViews & addArrangeSubViews
        addSubview(bjStackView)
        
        // SnapKit Layout Methods
        setUpBJStackView()
        
        // DataBinding
        setDataBinding()
        
    }
    
    private func setUpBJStackView() {
        bjStackView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
            $0.height.equalToSuperview()
        }
    }
    
    private func setUpStackViewItem(item: DallaBJStackViewItem) {
        item.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
        }
    }
    
    // viewModel의 Observable 타입의 프로퍼티인 topTenList에 대해서 bind 메서드를 호출하여 topTenList의 변경 시, 아래의 클로저를 호출하는 메서드
    private func setDataBinding() {
        viewModel.topTenList.bind { [weak self] _ in
            guard let self = self else { return }
            
            // topTenStackView가 비어있다면, 제거하지 않음
            if !self.bjStackView.arrangedSubviews.isEmpty {
                self.bjStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
            }
            
            // 데이터만큼 topTenStackViewItem을 생성해서 topTenStackView에 추가
            self.viewModel.topTenList.value.enumerated().forEach { (index, data) in
                let topTenStackViewItem = DallaBJStackViewItem()
                
                self.bjStackViewItemBinding(item: topTenStackViewItem, data: data)

                self.bjStackView.addArrangedSubview(topTenStackViewItem)
                // SnapKit Layout
                self.setUpStackViewItem(item: topTenStackViewItem)
            }
        }
    }

    private func bjStackViewItemBinding(item: DallaBJStackViewItem, data: DallaTopTen) {
        item.profileImageView.image = data.profileImage
        item.profileNameLabel.text = data.memNick
        
        switch data.liveButtonState {
        case .live:
            item.liveButton.setImage(UIImage(named: "btn_mini_live"), for: .normal)
        case .listen:
            item.liveButton.setImage(UIImage(named: "btn_mini_listen"), for: .normal)
        default:
            break
        }
        
        guard let rankingData = data.ranking else { return }
        let ranking = String(rankingData)
        item.rankingImageView.image = UIImage(named: "number_W-\(ranking)")
    }
}
