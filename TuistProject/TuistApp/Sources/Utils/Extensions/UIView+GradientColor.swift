//
//  UIView+GradientColor.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

extension UIView {
    func setGradientLayer(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.bounds.width / 2
        gradientLayer.colors = colors
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}


enum GradientColor {
    // DallaBJStoryView Gradient
    static let activatedColors: [CGColor] = [UIColor(red: 255 / 255, green: 60 / 255, blue: 123 / 255, alpha: 1).cgColor,
                                             UIColor(red: 255 / 255, green: 133 / 255, blue: 101 / 255, alpha: 1).cgColor]
    
    static let deactivatedColors: [CGColor] = [UIColor(red: 204 / 255, green: 204 / 255, blue: 204 / 255, alpha: 1).cgColor,
                                               UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1).cgColor]
}
