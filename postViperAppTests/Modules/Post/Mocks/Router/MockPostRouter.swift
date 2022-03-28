//
//  MockPostRouter.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import UIKit
@testable import postViperApp

struct PostsRouterCalls {
    var didPresentDetailPost: Bool = false
}


class MockPostRouter: AnyPostsRouterProtocol {
    
    var view: PostsViewController
    
    init(view: PostsViewController) {
        self.view = view
    }
    
    lazy var calls = PostsRouterCalls()
    
    func presentDetailPost(post: Post, navController: UINavigationController?) {
        calls.didPresentDetailPost = true
    }
}


