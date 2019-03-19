//
//  Landscape.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/18/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import Foundation
import UIKit

class Landscape {
    internal var mainImage: UIImage?
    internal var title: String!
    internal var content: String!
    
    init(mainImage: UIImage, title: String, content: String) {
        self.mainImage = mainImage
        self.title = title
        self.content = content
    }
}
