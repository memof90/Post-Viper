//
//  DetailPostPresenter.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import UIKit


final class DetailPostPresenter: AnyDetailPostPresenterInputProtocol {
    
    
    var post: Post?
    
    var router: AnyPostsDetailRouterProtocol?
        
    weak var view: AnyDetailPostPresenterOutputProtocol?
    
    var getDetailPostInteractor: AnyGetDetailPostInteractorInputProtocol?
    
    var detailComment: [Comments] = []
    
    var detailUser: Users?
    
    func getDetailPost() {
        
        guard let post = post else {
            return
        }
        
        getDetailPostInteractor?.executePost(post: post)

    }
    
    func getDetailComment() {
        
        if let id = post?.id {
            getDetailPostInteractor?.executeComments(idPots: id, idComments: id)
        }
    }
    
    func getDetailUser() {
        
        if let id = post?.id {
            getDetailPostInteractor?.executeUsers(idPots: id, idUsers: id)
        }
    }
}


extension DetailPostPresenter: AnyGetDetailPostInteractorOutputProtocol {

    func didRetrieveDetailPosts(_ detailPost: Post) {
        self.post = detailPost
        DispatchQueue.main.async { [weak self] in
            self?.view?.didRetrieveDetailPost()
        }
    }
    
    func didRetrieveDetailComments(_ detailComments: [Comments]) {
        self.detailComment = detailComments
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didRetrieveDetailComments()
        }
        
        detailComments.forEach { (moviess) in
            print(moviess.name)
        }
    }
    
    func didRetrieveDetailUsers(_ detailUsers: Users) {
        self.detailUser = detailUsers
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didRetrieveDetailUsers()
        }
    }
    
    func didGetError(_ error: CustomError) {
        view?.didGetError(error)
    }
}
