//
//  PostPresenterProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import UIKit

protocol AnyPostsPresenterInputProtocol {
    
    var view: AnyPostsPresenterOutputProtocol? { get set }
    var router: AnyPostsRouterProtocol? { get set }
    var getPostsInteractor: AnyGetPostsInteractorInputProtocol? { get set }
    var posts: [Post] { get set }
    
    func getPost()
    func goToDetail(post: Post, view: UINavigationController?)
}

protocol AnyPostsPresenterOutputProtocol: AnyObject {
    
    func didRetrievePosts()
    func didDeletePosts()
    func didGetError(_ message: String)
    func endRefresh()
}
