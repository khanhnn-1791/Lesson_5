//
//  ItemTestCell.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/18/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class ItemTestCell: UITableViewCell {

    @IBOutlet weak var componentView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var landscapeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    internal var landscape: Landscape! {
        didSet {
            mainImageView.image = landscape.mainImage
            landscapeLabel.text = landscape.title
            contentLabel.text = landscape.content
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mainImageView.layer.masksToBounds = true
        mainImageView.layer.cornerRadius = 12
        
        componentView.layer.masksToBounds = false
        componentView.layer.cornerRadius = 12
//        componentView.layer.shadowColor = UIColor.red.cgColor
//        componentView.layer.shadowOpacity = 0.5
//        componentView.layer.shadowOffset = CGSize(width: -5, height: 5)
//        componentView.layer.shadowRadius = 1
//
//        componentView.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        componentView.layer.shouldRasterize = true
//        componentView.layer.rasterizationScale = UIScreen.main.scale
        componentView.dropShadow()
        
    }
}
