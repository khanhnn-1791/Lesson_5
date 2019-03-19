//
//  Message.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/19/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import Foundation
import UIKit

class Message {
    internal var content: String!
    internal var sender: Int!
    
    init(content: String, sender: Int = 0) {
        self.content = content
        self.sender = sender
    }
}
