//
//  UITableViewExtensions.swift
//  postViperApp
//
//  Created by Memo Figueredo on 25/3/22.
//

import UIKit

// MARK: - Implementing refresh and handle errors

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 16)
        messageLabel.sizeToFit()
        backgroundView = messageLabel
    }
}
