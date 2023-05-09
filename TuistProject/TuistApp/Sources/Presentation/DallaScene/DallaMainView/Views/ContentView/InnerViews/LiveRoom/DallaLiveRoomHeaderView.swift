//
//  DallaLiveRoomHeaderView.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Then
import SnapKit

enum RoomHeaderViewButtonState {
    case all
    case video
    case radio
    case newDJ
}

protocol RoomHeaderViewDelegate: AnyObject {
    func didTapHeaderButton(state: RoomHeaderViewButtonState)
}

class DallaLiveRoomHeaderView: UIView {
    let headerTitleLabel = UILabel().then {
        $0.text = "🚀 지금 라이브 중!"
        $0.font = TuistAppFontFamily.Suit.semiBold.font(size: 19.0)
        $0.textColor = UIColor.blackFontColor
    }
    
    let headerButtonStackView = UIStackView().then {
        $0.distribution = .fillEqually
    }
    
    let totalButtonItem = LiveRoomHeaderItemView(title: "전체")
    let videoButtonItem = LiveRoomHeaderItemView(title: "VIDEO")
    let radioButtonItem = LiveRoomHeaderItemView(title: "RADIO")
    let newDJButtonItem = LiveRoomHeaderItemView(title: "신입DJ")

    lazy var headerViewButtonsArray = [totalButtonItem, videoButtonItem, radioButtonItem, newDJButtonItem]
    
    weak var delegate: RoomHeaderViewDelegate?
    
    init() {
        super.init(frame: .zero)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addArrangeSubViews
        addButtonItem()
        
        // addSubViews
        addSubview(headerTitleLabel)
        addSubview(headerButtonStackView)
        
        // SnapKit Layout Methods
        setUpHeaderTitleLabel()
        setUpHeaderButtonStackView()
        setInitHeaderViewItem()
        setHeaderButtonAction()
    }
    
    private func addButtonItem() {
        headerViewButtonsArray.forEach {
            headerButtonStackView.addArrangedSubview($0)
        }
    }
    
    private func setUpHeaderTitleLabel() {
        headerTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
            $0.height.equalTo(26)
        }
    }
    
    private func setUpHeaderButtonStackView() {
        headerButtonStackView.snp.makeConstraints {
            $0.top.equalTo(headerTitleLabel.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setInitHeaderViewItem() {
        totalButtonItem.titleButton.isSelected = true
        totalButtonItem.selectedStatusBar.isHidden = false
    }
    
    private func setHeaderButtonAction() {
        headerViewButtonsArray.forEach {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(categoryButtonTapped(sender:)))
            tapGesture.cancelsTouchesInView = true
            $0.addGestureRecognizer(tapGesture)
        }
    }
    
    private func toggleHeaderItemState(headerItemView: LiveRoomHeaderItemView) {
        headerViewButtonsArray.forEach {
            $0.titleButton.isSelected = false
            $0.selectedStatusBar.isHidden = true
        }

        headerItemView.titleButton.isSelected = true
        headerItemView.selectedStatusBar.isHidden = false
    }
    
    private func setHeaderState(sender: UIButton) {
        var state: RoomHeaderViewButtonState = .all
        
        switch sender.titleLabel?.text {
        case "전체":
            state = .all
        case "VIDEO":
            state = .video
        case "RADIO":
            state = .radio
        case "신입DJ":
            state = .newDJ
        default:
            break
        }
        
        self.delegate?.didTapHeaderButton(state: state)
    }
    
    deinit {
        print("DallaLiveHeaderView Deinit")
    }
}

extension DallaLiveRoomHeaderView {
    @objc
    private func categoryButtonTapped(sender: UITapGestureRecognizer) {
        // isSelected 상태 초기화 후 sender만 상태 변경
        guard let headerItemView = sender.view as? LiveRoomHeaderItemView else { return }
        
        toggleHeaderItemState(headerItemView: headerItemView)
        setHeaderState(sender: headerItemView.titleButton)
        
    }
}
