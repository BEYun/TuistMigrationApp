//
//  DallaLiveCollectionViewCell.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Then
import Kingfisher

class DallaLiveRoomCollectionViewCell: UICollectionViewCell {
    let profileImageView = UIImageView()
    let mediaTypeImageView = UIImageView().then {
        $0.image = TuistAppAsset.icoVideo.image
    }
    let guestProfileImageView = UIImageView().then {
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
    }
    
    let contentWrapperView = UIView()
    
    let badgeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillProportionally
        $0.spacing = 2
    }
    let badgeImageView = UIImageView().then {
        $0.image = TuistAppAsset.bdgStar.image
    }
    let cupidOneImageView = UIImageView().then {
        $0.image = TuistAppAsset.icoCupid01.image
    }
    let cupidTwoImageView = UIImageView().then {
        $0.image = TuistAppAsset.icoCupid02.image
    }
    let cupidThreeImageView = UIImageView().then {
        $0.image = TuistAppAsset.icoCupid03.image
    }
    let roomtitleLabel = UILabel().then {
        
        $0.font = TuistAppFontFamily.Suit.semiBold.font(size: 15.0)
        $0.textColor = UIColor.secondBlackFontColor
    }
    
    let bjInfoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 2
    }
    let genderImageView = UIImageView()
    let bjNameLabel = UILabel().then {
        $0.font = TuistAppFontFamily.Suit.regular.font(size: 13.0)
        $0.textColor = UIColor.bjNameGrayFontColor
    }
    
    let roomInfoWrapperView = UIView()
    let roomMemberImageView = UIImageView().then {
        $0.image = TuistAppAsset.peopleGS.image
    }
    let roomMemberCountLabel = UILabel().then {
        $0.font = TuistAppFontFamily.Suit.medium.font(size: 13.0)
        $0.textColor = UIColor.memberCountFontColor
    }
    let likeImageView = UIImageView().then {
        $0.image = TuistAppAsset.heart.image
    }
    let likeCountLabel = UILabel().then {
        $0.font = TuistAppFontFamily.Suit.medium.font(size: 13.0)
        $0.textColor = UIColor.memberCountFontColor
    }
    
    lazy var bjInfoArray = [genderImageView, bjNameLabel]
    lazy var badgeArray = [badgeImageView, cupidOneImageView, cupidTwoImageView, cupidThreeImageView]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        // addArrangeSubViews
        bjInfoArray.forEach {
            bjInfoStackView.addArrangedSubview($0)
        }
        badgeArray.forEach {
            badgeStackView.addArrangedSubview($0)
        }
        
        // addSubViews
        addSubview(profileImageView)
        addSubview(contentWrapperView)
        
        profileImageView.addSubview(mediaTypeImageView)
        profileImageView.addSubview(guestProfileImageView)
        
        contentWrapperView.addSubview(badgeStackView)
        contentWrapperView.addSubview(roomtitleLabel)
        contentWrapperView.addSubview(bjInfoStackView)
        contentWrapperView.addSubview(roomInfoWrapperView)
        
        roomInfoWrapperView.addSubview(roomMemberImageView)
        roomInfoWrapperView.addSubview(roomMemberCountLabel)
        roomInfoWrapperView.addSubview(likeImageView)
        roomInfoWrapperView.addSubview(likeCountLabel)
        
        // SnapKit Layout Methods
        setUpProfileImageView()
        setUpMediaTypeImageView()
        setUpGuestProfileImageView()
        setUpContentWrapperView()
        setUpBadgeStackView()
        setUpRoomTitleLabel()
        setUpBJInfoStackView()
        setUpRoomInfoWrapperView()
        setUpRoomMemberImageView()
        setUpRoomMemberCountLabel()
        setUpLikeImageView()
        setUpLikeCountLabel()
    }
    
    // MARK: Layout Methods
    
    private func setUpProfileImageView() {
        profileImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(DallaDefaultConstraint.horizontalInset)
            $0.width.height.equalTo(112)
        }
        
        profileImageView.layer.cornerRadius = 8
        profileImageView.clipsToBounds = true
    }
    
    private func setUpMediaTypeImageView() {
        mediaTypeImageView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(8)
            $0.width.height.equalTo(20)
        }
    }
    
    private func setUpGuestProfileImageView() {
        guestProfileImageView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.width.height.equalTo(51)
        }
        
        guestProfileImageView.layer.cornerRadius = 8
        guestProfileImageView.clipsToBounds = true
    }
    
    private func setUpContentWrapperView() {
        contentWrapperView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(8)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
        }
    }
    
    private func setUpBadgeStackView() {
        badgeStackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
    }
    
    private func setUpRoomTitleLabel() {
        roomtitleLabel.snp.makeConstraints {
            $0.top.equalTo(badgeStackView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        roomtitleLabel.sizeToFit()
    }
    
    private func setUpBJInfoStackView() {
        bjInfoStackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(roomInfoWrapperView.snp.top).offset(-6)
        }
    }
    
    private func setUpRoomInfoWrapperView() {
        roomInfoWrapperView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(16)
        }
    }
    
    private func setUpRoomMemberImageView() {
        roomMemberImageView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
            $0.width.height.equalTo(16)
        }
    }
    
    private func setUpRoomMemberCountLabel() {
        roomMemberCountLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(roomMemberImageView.snp.trailing)
            $0.width.height.equalTo(16)
        }
    }
    
    private func setUpLikeImageView() {
        likeImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(roomMemberCountLabel.snp.trailing).offset(9)
            $0.width.height.equalTo(16)
        }
    }
    
    private func setUpLikeCountLabel() {
        likeCountLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(likeImageView.snp.trailing)
            $0.width.height.equalTo(16)
        }
    }
    
    // MARK: Cell Configure Methods
    
    func configure(item: DallaLiveRoom) {
        guard let bjImgURL = URL(string: item.bjProfileImage) else { return }
        guard let guestImgURL = URL(string: item.guestProfileImage) else { return }
        
        profileImageView.kf.setImage(with: bjImgURL, placeholder: TuistAppAsset.profileNone.image)
        guestProfileImageView.kf.setImage(with: guestImgURL, placeholder: TuistAppAsset.profileNone.image)
        checkMediaType(type: item.typeMedia)
        roomtitleLabel.text = item.roomTitle
        checkGenderType(gender: item.bjMemGender)
        bjNameLabel.text = item.bjNickName
        roomMemberCountLabel.text = String(item.countLiveMem)
        likeCountLabel.text = String(item.countGood)
    }
    
    private func checkMediaType(type: String) {
        switch type {
        case "v" :
            mediaTypeImageView.image = TuistAppAsset.icoVideo.image
        default :
            break
        }
    }
    
    private func checkGenderType(gender: String) {
        if gender == "m" {
            genderImageView.image = TuistAppAsset.icoMale.image
        } else {
            genderImageView.image = TuistAppAsset.icoFemale.image
        }
    }
}
