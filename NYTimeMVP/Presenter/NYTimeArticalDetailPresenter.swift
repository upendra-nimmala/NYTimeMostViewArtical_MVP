//
//  NYTimeArticalDetailPresenter.swift
//  NYTimeMVP
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import Foundation
class NYTimeArticalDetailPresenter {
    
    private var detailView : NYTimeArticalDetailsView?
    
    init() {  }
    
    func attachView(view: NYTimeArticalDetailsView) {
        detailView = view
    }
    
    func detachView() {
        detailView = nil
    }
    func getNYTimeMostViewedArticalURL() {
                self.detailView?.loadMostViewedArticalURL()
    }
}
