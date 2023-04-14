//
//  MainTabBarController.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let dallaVC = DallaMainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initControllers()
    }
    
    private func initControllers() {
        let kakaoNavigationController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "kakaoNavigationController") as! UINavigationController
        let chatGPTNavigationController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "chatGPTNavigationController") as! UINavigationController
        
        self.setViewControllers([kakaoNavigationController, chatGPTNavigationController, dallaVC], animated: false)
        
        dallaVC.tabBarItem = UITabBarItem(title: "달라", image: UIImage(named: "Dalla_logo"), selectedImage: nil)
    }
    
}
