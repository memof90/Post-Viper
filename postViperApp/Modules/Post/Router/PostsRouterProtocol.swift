//
//  PostsRouterProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation
import UIKit

protocol AnyPostsRouterProtocol {
//    static func createModule() -> PostsViewController
    var view: PostsViewController  {get set}
    func presentDetailPost(post: Post, navController: UINavigationController?)
}
