//
//  NewBJViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/03.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

class NewBJViewModel {
    // newBJList를 위한 랜덤 데이터
    let combinedArray = bjDummy + fanDummy + teamDummy
    lazy var newBJList = (1...10).compactMap { _ in combinedArray.randomElement() }
    
    deinit {
        print("DallaMainViewModel Deinit")
    }
}
