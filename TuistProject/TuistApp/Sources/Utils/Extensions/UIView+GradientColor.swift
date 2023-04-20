//
//  UIView+GradientColor.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientLayer(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = colors
        self.layer.addSublayer(gradientLayer)
    }
}


enum GradientColor {
    // DallaMainBannerView Gradient
    static let mainBannerDefaultColors: [UIColor] = [UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0)),
                                                       UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 0.8)),
                                                       UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 1))]
    
    // DallaBJStoryView Gradient
    static let activatedColors: [UIColor] = [UIColor(cgColor: CGColor(red: 255, green: 60, blue: 123, alpha: 1)),
                                            UIColor(cgColor: CGColor(red: 255, green: 133, blue: 101, alpha: 1))]
    
    static let deactivatedColors: [UIColor] = [UIColor(cgColor: CGColor(red: 204, green: 204, blue: 204, alpha: 1)),
                                              UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 1))]
}
