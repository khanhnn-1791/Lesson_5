//
//  MessageCell.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/19/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    internal var message: Message! {
        didSet{
            contentLabel.text = message.content
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        messageView.layer.masksToBounds = true
        messageView.layer.cornerRadius = 12
    }
    
//    private func validate() {
//        if message.sender == 0 {
//            messageView.translatesAutoresizingMaskIntoConstraints = false
//            messageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 44).isActive = true
//            messageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
//            messageView.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: 8).isActive = true
//            messageView.backgroundColor = UIColor(red: 53/255, green: 149/255, blue: 255/255, alpha: 1)
//            layoutIfNeeded()
//        }
//    }
}
