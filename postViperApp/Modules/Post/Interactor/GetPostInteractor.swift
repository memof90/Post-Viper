//
//  GetPostInteractor.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

final class GetPostsInteractor: AnyGetPostsInteractorInputProtocol {
    var repository: AnyPostRepositoryInputProtocol?
    
    var presenter: AnyGetPostsInteractorOutputProtocol?
    
    func execute() {
        repository?.getPost()
    }
}

extension GetPostsInteractor: AnyPostRepositoryOutputProtocol {
    
    func didRetrivePost(_ post: [Post]) {
        let postList = post
        presenter?.didRetrievePosts(postList)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
    
}
