//
//  DetailPostRespositoryProtocols.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

protocol AnyDetailPostRespositoryInputProtocol {
    var remoteDataSourceComments: AnyDetailCommentsServiceProtocol? { get set }
    var remoteDataSourceUsers: AnyDetailUsersServiceProtocol? { get set }
    var interactor: AnyDetailPostRespositoryOutputProtocol? { get set }
    
    func getDetailPosts(post: Post)
    func getDetailComments(idPost: Int, idComments: Int)
    func getDetailUsers(idUsers: Int)
}

protocol AnyDetailPostRespositoryOutputProtocol: AnyObject {
    
    func didRetrieveDetailPost(_ detailPost: Post)
    func didRetrieveDetailComments(_ detailComments: [Comments])
    func didRetrieveDetailUsers(_ detailUsers: Users)
    func didGetError(_ error: CustomError)
}
