//
//  GetPostInteractorProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

typealias PostsCompletion = (Result<[Post], CustomError>) -> Void

protocol AnyGetPostsInteractorInputProtocol {
    
    var repository: AnyPostRepositoryInputProtocol? { get set}
    var presenter: AnyGetPostsInteractorOutputProtocol? { get set }
    
    func execute()
}


protocol AnyGetPostsInteractorOutputProtocol: AnyObject {
    
    func didRetrievePosts(_ posts: [Post])
    func didGetError(_ error: CustomError)
}
