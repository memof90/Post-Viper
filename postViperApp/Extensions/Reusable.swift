//
//  Reusable.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import UIKit

// MARK: - Reusable Identifier to collection Views and Tables Views

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable { }

extension UITableViewCell: Reusable { }

