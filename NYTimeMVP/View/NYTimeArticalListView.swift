//
//  NYTimeArticalListView.swift
//  NYTimeMVP
//
//  Created by Upendra Nimmala on 09/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import Foundation

protocol NYTimeArticalListView {
    func getMostViewedArticals(articals: Results)
    func stopAnimator()
}
