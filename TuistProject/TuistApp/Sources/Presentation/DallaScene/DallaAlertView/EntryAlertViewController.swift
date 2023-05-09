//
//  EntryAlertViewController.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/08.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

class EntryAlertViewController: UIViewController {
    private var bjName: String
    
    
    private let containerView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.font = TuistAppFontFamily.Suit.medium.font(size: 15.0)
        $0.textAlignment = .center
        $0.text = "\(bjName)님의\n방송방에 입장하시겠습니까?"
    }
    
    private let cancelButton = UIButton().then {
        $0.setTitle("아니요", for: .normal)
        $0.setTitleColor(UIColor.bjNameGrayFontColor, for: .normal)
        $0.titleLabel?.font = TuistAppFontFamily.Suit.medium.font(size: 15.0)
    }
    
    private let enterButton = UIButton().then {
        $0.setTitle("네", for: .normal)
        $0.setTitleColor(UIColor.DallaActiveBackgroundColor, for: .normal)
        $0.titleLabel?.font = TuistAppFontFamily.Suit.bold.font(size: 15.0)
    }
    
    init(bjName: String) {
        self.bjName = bjName
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black.withAlphaComponent(0.2)
    }
    
    private func initUI() {
        // addSubViews
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(cancelButton)
        containerView.addSubview(enterButton)
        
        // SnapKit Layout Methods
        setContainerView()
//        setTitleLabel()
//        setCancelButton()
//        setEnterButton()
    }
    
    private func setContainerView() {
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(200)
            $0.center.equalToSuperview()
        }
        containerView.layer.cornerRadius = 10
    }
    
    private func setTitleLabel() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(0.75).inset(2)
        }
    }
    
    private func setCancelButton() {
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.bottom.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(0.5)
        }
    }
    
    private func setEnterButton() {
        enterButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.bottom.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(0.5)
        }
    }

}
