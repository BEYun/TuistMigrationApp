//
//  UIApplication+UIEdgeInsets.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/18.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

extension UIApplication {
    var safeAreaEdgeInsets: UIEdgeInsets {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}
