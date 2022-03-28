//
//  PostsViewProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

protocol AnyPotsViewProtocol: AnyObject {
    
    var presenter: AnyPostsPresenterInputProtocol? { get set }
}

protocol AnyPostsViewDelegate: AnyObject {
    
    func showDetail(of post: Post)
    func refresh()
}
