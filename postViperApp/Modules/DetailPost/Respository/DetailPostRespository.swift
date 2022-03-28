//
//  DetailPostRespository.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

final class DetailPostRespository: AnyDetailPostRespositoryInputProtocol {
  
    var remoteDataSourceUsers: AnyDetailUsersServiceProtocol?
    var remoteDataSourceComments: AnyDetailCommentsServiceProtocol?
    
    weak var interactor: AnyDetailPostRespositoryOutputProtocol?
    
    func getDetailComments(idPost: Int, idComments: Int) {
        remoteDataSourceComments?.getComments(idPost: idPost, idComment: idComments, completion: { result in
            switch result {
            case .success(let detailComment):
                self.interactor?.didRetrieveDetailComments(detailComment)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        })
    }
    
    func getDetailUsers(idUsers: Int) {
        remoteDataSourceUsers?.getUsers(idUser: idUsers, completion: { result in
            switch result {
            case .success(let detailUser):
                self.interactor?.didRetrieveDetailUsers(detailUser)
            case .failure(let error):
                self.interactor?.didGetError(error)
            }
        })
    }
    
    func getDetailPosts(post: Post) {

    }
}
