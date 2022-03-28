//
//  PostPresenter.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import UIKit

final class PostsPresenter: AnyPostsPresenterInputProtocol {

    var router: AnyPostsRouterProtocol?
    
    weak var view: AnyPostsPresenterOutputProtocol?
    
    var getPostsInteractor: AnyGetPostsInteractorInputProtocol?
    
    var posts: [Post] = []
    
    func getPost() {
        getPostsInteractor?.execute()
    }
    
    func goToDetail(post: Post, view: UINavigationController?) {
        router?.presentDetailPost(post: post, navController: view)
    }
}


extension PostsPresenter:  AnyGetPostsInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [Post]) {
        self.posts = posts
        DispatchQueue.main.async { [weak self] in
            self?.view?.endRefresh()
            self?.view?.didRetrievePosts()
        }
    }
    
    func didGetError(_ error: CustomError) {
        
    }
    
    
}
