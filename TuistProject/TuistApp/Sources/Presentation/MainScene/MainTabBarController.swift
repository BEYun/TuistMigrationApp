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
    let viewModel = DallaMainViewModel()
    lazy var dallaVC = DallaMainViewController(dallaMainView: DallaMainView(viewModel: viewModel), viewModel: viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initControllers()
    }
    
    private func initControllers() {
        self.viewControllers?.append(dallaVC)
        
        dallaVC.tabBarItem = UITabBarItem(title: "달라", image: UIImage(named: "Dalla_icon"), selectedImage: nil)
    }
}
