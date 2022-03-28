//
//  GetDetailPostInteractorProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

typealias DetailsCommentsCompletion = (Result<[Comments], CustomError>) -> Void
typealias DetailsUsersCompletion = (Result<[Users], CustomError>) -> Void

protocol AnyGetDetailPostInteractorInputProtocol {
    
    var repository: AnyDetailPostRespositoryInputProtocol? { get set }
    var presenter: AnyGetDetailPostInteractorOutputProtocol? { get set }
    
    func executePost(post: Post)
    func executeComments(idPots: Int, idComments: Int)
    func executeUsers(idPots: Int, idUsers: Int)
}

protocol AnyGetDetailPostInteractorOutputProtocol: AnyObject {
    
    func didRetrieveDetailPosts(_ detailPost: Post)
    func didRetrieveDetailComments(_ detailComments: [Comments])
    func didRetrieveDetailUsers(_ detailUsers: Users)
    func didGetError(_ error: CustomError)
}
