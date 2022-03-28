//
//  MockInteractorInput.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import Foundation
@testable import postViperApp

struct GetPotsInteractorInputCalls {
    var didExecute: Bool = false
}

class MockInteractorInput: AnyGetPostsInteractorInputProtocol {
    var repository: AnyPostRepositoryInputProtocol?
    
    var presenter: AnyGetPostsInteractorOutputProtocol?
    
    lazy var calls = GetPotsInteractorInputCalls()
    
    func execute() {
        calls.didExecute = true
        let posts = [
            Post(userId: 1, id: 1, title: "", description: "")
        ]
        presenter?.didRetrievePosts(posts)
    }
}
