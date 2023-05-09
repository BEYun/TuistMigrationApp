//
//  UIView+GradientColor.swift
//  TuistApp
//
//  Created by BEYun on 2023/04/17.
//  Copyright © 2023 BEYun. All rights reserved.
//

import UIKit

enum GradientColor {
    // DallaMainBanner Gradient
    static let bannerViewColors: [CGColor] = [UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0).cgColor,
                                              UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.8).cgColor,
                                              UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1).cgColor]
    
    // DallaBJStoryView Gradient
    static let activatedColors: [CGColor] = [UIColor(red: 255 / 255, green: 60 / 255, blue: 123 / 255, alpha: 1).cgColor,
                                             UIColor(red: 255 / 255, green: 133 / 255, blue: 101 / 255, alpha: 1).cgColor]
    
    static let deactivatedColors: [CGColor] = [UIColor(red: 204 / 255, green: 204 / 255, blue: 204 / 255, alpha: 1).cgColor,
                                               UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1).cgColor]
}
