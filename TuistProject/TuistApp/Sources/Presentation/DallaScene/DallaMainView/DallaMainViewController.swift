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
    
}
