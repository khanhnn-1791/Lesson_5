//
//  MessageSenderCell.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/19/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class MessageSenderCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    internal var message: Message! {
        didSet {
            contentLabel.text = message.content
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.layer.masksToBounds = true
        messageView.layer.cornerRadius = 12
    }

}
