//
//  GetDetailPostInteractor.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

final class GetDetailPostInteractor: AnyGetDetailPostInteractorInputProtocol {

    var repository: AnyDetailPostRespositoryInputProtocol?
    
    var presenter: AnyGetDetailPostInteractorOutputProtocol?
    
    func executePost(post: Post) {
        repository?.getDetailPosts(post: post)
    }
    
    func executeComments(idPots: Int, idComments: Int) {
        repository?.getDetailComments(idPost: idPots, idComments: idComments)
    }
    
    func executeUsers(idPots: Int, idUsers: Int) {
        repository?.getDetailUsers(idUsers: idUsers)
    }
}

extension GetDetailPostInteractor: AnyDetailPostRespositoryOutputProtocol {
    
    func didRetrieveDetailPost(_ detailPost: Post) {
        let postDetail = detailPost
        presenter?.didRetrieveDetailPosts(postDetail)
    }
    
    func didRetrieveDetailComments(_ detailComments: [Comments]) {
        let postComments = detailComments
        presenter?.didRetrieveDetailComments(postComments)
    }
    
    func didRetrieveDetailUsers(_ detailUsers: Users) {
        let postUser = detailUsers
        presenter?.didRetrieveDetailUsers(postUser)
    }
    
    func didGetError(_ error: CustomError) {
        presenter?.didGetError(error)
    }
}
