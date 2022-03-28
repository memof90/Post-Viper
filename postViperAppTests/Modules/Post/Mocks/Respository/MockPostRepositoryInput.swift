//
//  MockPostRepositoryInput.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import Foundation
@testable import postViperApp

struct PostRepositoryInputCalls {
    var didRetrievePosts: Bool = false
    var didGetError: Bool = false
    var post: [Post]? = nil
}

class MockPotsRepositoryInput: AnyPostRepositoryInputProtocol {
    var interactor: AnyPostRepositoryOutputProtocol?
    
    var remoteDataSource: AnyPostServiceProtocol?
    
    lazy var calls = PostRepositoryInputCalls()
    
    func getPost() {
        remoteDataSource?.getPostService(completion: { result in
            switch result {
            case .success(let posts):
                self.calls.didRetrievePosts = true
                self.interactor?.didRetrivePost(posts)
                self.calls.post = posts
            case .failure(let error):
                self.calls.didGetError = true
                self.interactor?.didGetError(error)
            }
        })
    }
}
