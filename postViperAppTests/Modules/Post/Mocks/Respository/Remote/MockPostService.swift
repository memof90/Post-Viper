//
//  MockPostService.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import Foundation
@testable import postViperApp

struct PostServiceCalls {
    var didGetPost: Bool = false
}


class MockPostService: BaseService, AnyPostServiceProtocol {
    
    lazy var calls = PostServiceCalls()
    
    func getPostService(completion: @escaping PostCompletion) {
        calls.didGetPost = true
        sendRequestMock(url: "", of: [Post].self, method: .get, completion: completion)
    }

}
