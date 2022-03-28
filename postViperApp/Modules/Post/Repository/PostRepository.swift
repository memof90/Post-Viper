//
//  PostRepository.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation


final class PostRepository: AnyPostRepositoryInputProtocol {
  
    var remoteDataSource: AnyPostServiceProtocol?
    weak var interactor: AnyPostRepositoryOutputProtocol?
    
    func getPost() {
        remoteDataSource?.getPostService(completion: { result in
            switch result {
            case .success(let post):
                self.interactor?.didRetrivePost(post)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        })
    }
}
