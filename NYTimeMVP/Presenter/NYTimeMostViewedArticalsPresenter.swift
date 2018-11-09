//
//  NYTimeMostViewedArticalsPresenter.swift
//  NYTimeMVP
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import Foundation

class NYTimeMostViewedArticalsPresenter {
    
    private var articalView : NYTimeArticalListView?
    
    init() {  }
    
    func attachView(view: NYTimeArticalListView) {
        articalView = view
    }
    
    func detachView() {
        articalView = nil
    }
    
    func getNYTimeMostViewedArticals() {
        NYTimeArticalServiceHandler.shared.getNYTimeMostViewedArticals(successHandler: { (mostViewedArticlas) in
            DispatchQueue.main.async {
                self.articalView?.getMostViewedArticals(articals: mostViewedArticlas)
                self.articalView?.stopAnimator()
            }
        }, errorHandler: { (error) in
            print(error)
        })
        
    }
}
