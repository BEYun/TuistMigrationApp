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
    
    let dallaMainView: DallaMainView
    
    let viewModel: DallaMainViewModel
    
    lazy var mainBannerAdaper = MainBannerAdapter(collectionView: dallaMainView.contentView.mainBannerCollectionView)
    lazy var bjStoryAdapter = BJStoryAdapter(collectionView: dallaMainView.contentView.bjStoryCollectionView)

    init(dallaMainView: DallaMainView, viewModel: DallaMainViewModel) {
        self.dallaMainView = dallaMainView
        self.viewModel = viewModel
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
        
        mainBannerAdaper.adapterDataSource = viewModel
        mainBannerAdaper.adapterDelegate = viewModel
        
        bjStoryAdapter.adapterDataSource = viewModel
        bjStoryAdapter.adapterDelegate = viewModel
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
//        mainBannerAdaper.makeTimer()
//        guard let firstChild = tabBarController?.children.first else { return }myView.collectionView.delegate = myView.delegate
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            self?.tabBarController?.selectedViewController = firstChild
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    deinit {
        print("DallaMainViewController Deinit")
    }
}
