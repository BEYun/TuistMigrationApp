//
//  makeLiveRoomViewController.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/08.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then

class makeLiveRoomViewController: UIViewController {
    let containerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let titleLabel = UILabel().then {
        $0.text = "만들기"
        $0.font = TuistAppFontFamily.Suit.bold.font(size: 18.0)
        $0.textColor = UIColor.blackFontColor
        $0.textAlignment = .center
    }
    
    let makeLiveButton = UIButton().then {
        $0.setTitle("라이브 방송하기", for: .normal)
        $0.setTitleColor(UIColor.blackFontColor, for: .normal)
        $0.titleLabel?.font = TuistAppFontFamily.Suit.medium.font(size: 15.0)
    }
    
    let uploadClipButton = UIButton().then {
        $0.setTitle("클립 업로드", for: .normal)
        $0.setTitleColor(UIColor.blackFontColor, for: .normal)
        $0.titleLabel?.font = TuistAppFontFamily.Suit.medium.font(size: 15.0)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func initUI() {
        view.backgroundColor = .black.withAlphaComponent(0.2)
        
        // addSubViews
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(makeLiveButton)
        containerView.addSubview(uploadClipButton)
        
        // SnapKit Layout Methods
        setContainerView()
        setMakeLiveButton()
        setUploadClipButton()
        setUpDismissViewController()
    }
    
    private func setContainerView() {
        containerView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(0.28)
        }
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func setTitleLabel() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(0.3)
        }
    }
    
    private func setMakeLiveButton() {
        makeLiveButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.height.equalToSuperview().dividedBy(0.3)
        }
    }
    
    private func setUploadClipButton() {
        uploadClipButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(makeLiveButton)
            $0.height.equalToSuperview().dividedBy(0.3)
        }
    }
    
    private func setUpDismissViewController() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModalViewController))
        view.addGestureRecognizer(tapGesture)
    }
}

extension makeLiveRoomViewController {
    @objc
    private func dismissModalViewController() {
        dismiss(animated: true, completion: nil)
    }
}
