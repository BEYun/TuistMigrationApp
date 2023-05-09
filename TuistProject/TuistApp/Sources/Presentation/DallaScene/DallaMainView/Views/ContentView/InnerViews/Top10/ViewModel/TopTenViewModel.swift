//
//  TopTenViewModel.swift
//  TuistApp
//
//  Created by BEYun on 2023/05/02.
//  Copyright © 2023 BEYun. All rights reserved.
//

import Foundation

class TopTenViewModel {
    var topTenList: Observable<[DallaTopTen]> = Observable(bjDummy)
    
    deinit {
        print("TopTenViewModel Deinit")
    }
}

// MARK: DallaTopTenHeaderView Delegate Methods

extension TopTenViewModel: TopTenHeaderViewDelegate {
    func didTapHeaderButton(state: HeaderViewButtonState) {
        switch state {
        case .bj:
            topTenList.value = bjDummy
        case .fan:
            topTenList.value = fanDummy
        case .team:
            topTenList.value = teamDummy
        }
    }
    
}
