//
//  MockInteractorOuput.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import Foundation
@testable import postViperApp

struct GetPostsInteractorOutputCalls {
    var didRetrievePost: Bool = false
    var didGetError: Bool = false
}

class MockGetPostInteractorOutput: AnyGetPostsInteractorOutputProtocol {
    
    lazy var calls = GetPostsInteractorOutputCalls()
    
    func didRetrievePosts(_ posts: [Post]) {
        calls.didRetrievePost = true
    }
    
    func didGetError(_ error: CustomError) {
        calls.didGetError = true
    }
}
