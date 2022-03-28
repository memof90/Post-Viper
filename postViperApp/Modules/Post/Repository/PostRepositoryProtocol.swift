//
//  PostRepositoryProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

protocol AnyPostRepositoryInputProtocol {
    
    var interactor: AnyPostRepositoryOutputProtocol? { get set }
    var remoteDataSource: AnyPostServiceProtocol? { get set}
    
    func getPost()
}


protocol AnyPostRepositoryOutputProtocol: AnyObject {
    
    func didRetrivePost(_ posts: [Post])
    func didGetError(_ error: CustomError)
}
