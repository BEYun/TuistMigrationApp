//
//  MainTabBarController.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

import Alamofire

class MainTabBarController: UITabBarController {
    lazy var dallaVC = DallaMainViewController(viewModel: MainBannerViewModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initControllers()
    }
    
    private func initControllers() {
        self.viewControllers?.append(dallaVC)
        
        dallaVC.tabBarItem = UITabBarItem(title: "달라", image: TuistAppAsset.dallaIcon.image, selectedImage: nil)
    }
}
