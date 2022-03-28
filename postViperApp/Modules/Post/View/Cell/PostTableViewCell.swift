//
//  PostTableViewCell.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import UIKit

class PostTableViewCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet weak var TitleText: UILabel! {
        didSet {
            TitleText.numberOfLines = 0
            if let customFont = UIFont(name: "Nunito-Bold", size: 17.0) {
                TitleText.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: customFont)
            }
        }
    }
    
    @IBOutlet weak var CircleImageView: UIImageView!
    
    @IBOutlet weak var favoriteImageView: UIImageView! {
        didSet {
            favoriteImageView.isHidden = true
            favoriteImageView.tintColor = .systemYellow
        }
    }
    
}
