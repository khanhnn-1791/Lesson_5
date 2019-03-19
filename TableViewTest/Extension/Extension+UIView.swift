//
//  Extension+UIView.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/18/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.9
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 6
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
  
    
}
