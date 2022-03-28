//
//  CommentsTableViewCell.swift
//  postViperApp
//
//  Created by Memo Figueredo on 28/3/22.
//

import UIKit

class CommentsTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var emailTextLabel: UILabel! {
        didSet {
            emailTextLabel.numberOfLines = 0
            emailTextLabel.textColor = .systemGreen
        }
    }
    
    @IBOutlet weak var commentTextLabel: UILabel! {
        didSet {
            commentTextLabel.numberOfLines = 0
            if let customFont = UIFont(name: "Nunito-Regular", size: 20.0) {
                commentTextLabel.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
            }
        }
    }
    
    
}
