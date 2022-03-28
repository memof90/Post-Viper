//
//  MockPostPresenterInput.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import UIKit
@testable import postViperApp

struct PostPresenterInputCalls {
    var didGetPost: Bool = false
    var didGoToDetail: Bool = false
}


class MockPostPresenterInput: AnyPostsPresenterInputProtocol {
    
    var view: AnyPostsPresenterOutputProtocol?
    
    var router: AnyPostsRouterProtocol?
    
    var getPostsInteractor: AnyGetPostsInteractorInputProtocol?
    
    var posts: [Post] = []
    
    lazy var calls = PostPresenterInputCalls()
    
    func getPost() {
        calls.didGetPost = true
        posts = [
            Post(userId: 1, id: 1, title: "", description: "")
        ]
        view?.didRetrievePosts()
    }
    
    
    func goToDetail(post: Post, view: UINavigationController?) {
        calls.didGoToDetail = true
    }
    
    
}
