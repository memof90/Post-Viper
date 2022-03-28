//
//  MockPostPresenterOutput.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import UIKit
@testable import postViperApp

struct PostsPresenterOutputCalls {
    var didRetrievePosts: Bool = false
    var didDeletePosts: Bool = false
    var didGetError: Bool = false
    var didEndRefresh: Bool = false
}

class MockPostsPresenterOutput: AnyPostsPresenterOutputProtocol {

    lazy var calls = PostsPresenterOutputCalls()
    
    func didRetrievePosts() {
        calls.didRetrievePosts = true
    }
    
    func didDeletePosts() {
        calls.didDeletePosts = true
    }
    
    func didGetError(_ message: String) {
        calls.didGetError = true
    }
    
    func endRefresh() {
        calls.didEndRefresh = true
    }
    
}
