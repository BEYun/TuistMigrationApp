//
//  DallaMainViewController.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/14.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit
import SnapKit

class DallaMainViewController: UIViewController {
    
    let dallaMainView = DallaMainView()

    override func loadView() {
        self.view = dallaMainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        guard let firstChild = tabBarController?.children.first else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.tabBarController?.selectedViewController = firstChild
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    deinit {
        print("DallaMainViewController Deinit")
    }
}
