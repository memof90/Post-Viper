//
//  MockPostRepositoryOuput.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import Foundation
@testable import postViperApp

struct PostRepositoryOutputCalls {
    var didRetrievePosts: Bool = false
    var didGetError: Bool = false
}

class MockPostsRepositoryOutput: AnyPostRepositoryOutputProtocol {
   
    lazy var calls = PostRepositoryOutputCalls()
        
    func didRetrivePost(_ posts: [Post]) {
        calls.didRetrievePosts = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
    
}
