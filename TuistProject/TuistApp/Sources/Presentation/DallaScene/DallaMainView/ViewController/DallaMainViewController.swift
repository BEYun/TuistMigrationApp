//
//  DallaMainViewController.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import SnapKit
import Alamofire

class DallaMainViewController: UIViewController {
    
    let viewModel: MainBannerViewModel
    
    let dallaMainView: DallaMainView
    let contentView: DallaContentView
    let headerMenuView: DallaHeaderMenuView

    init(viewModel: MainBannerViewModel) {
        self.viewModel = viewModel
        self.dallaMainView = DallaMainView(viewModel: viewModel)
        self.contentView = dallaMainView.contentView
        self.headerMenuView = dallaMainView.headerMenuView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = dallaMainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate implement 방식 생각해보기
        contentView.delegate = self
        dallaMainView.footerView.delegate = self
        
//        presentEntryViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        // mainTabBar의 item을 선택해서 DallaMainView에서 나올 수 있음
        // FooterView의 Button의 addTarget으로 구현하기
//        guard let firstChild = tabBarController?.children.first else { return }myView.collectionView.delegate = myView.delegate
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            self?.tabBarController?.selectedViewController = firstChild
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        contentView.mainBannerCollectionView.mainBannerTimer.setUpTimerAction()
        contentView.eventBannerCollectionView.eventBannerTimer.setUpTimerAction()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
//    private func presentEntryViewController() {
//        viewModel.selectedItem.bind({ [weak self] item in
//            let entryVC = EntryAlertViewController(bjName: item.memNick)
//            self?.present(entryVC, animated: false)
//        })
//    }
    
    deinit {
        print("DallaMainViewController Deinit")
    }
}
