//
//  DetailPostPresenterProtocols.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import UIKit

protocol AnyDetailPostPresenterInputProtocol {
    
    var post: Post? { get set }
    var detailComment: [Comments] { get set}
    var detailUser: Users? { get set }
    var view: AnyDetailPostPresenterOutputProtocol? { get set }
    var getDetailPostInteractor: AnyGetDetailPostInteractorInputProtocol? { get set }
    var router: AnyPostsDetailRouterProtocol? { get set }
    
    func getDetailPost()
    func getDetailComment()
    func getDetailUser()
}

protocol AnyDetailPostPresenterOutputProtocol : AnyObject {
    
    func didRetrieveDetailPost()
    func didRetrieveDetailComments()
    func didRetrieveDetailUsers()
    func didGetError(_ error: CustomError)
    func endRefresh()
}
