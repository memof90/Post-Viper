//
//  PostsRouter.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation
import UIKit

final class PostsRouter: AnyPostsRouterProtocol {
   
    var view: PostsViewController
    
    init(view: PostsViewController) {
        self.view = view
    }
    
    
    func presentDetailPost(post: Post, navController: UINavigationController?) {
        let detailPostViewController: DetailPostViewController = DetailPostAssembly.build(post: post) 
        navController?.pushViewController(detailPostViewController, animated: true)
    }
    
//    static func createModule() -> PostsViewController {
//
//        typealias ViewProtocols = AnyPotsViewProtocol & AnyPostsPresenterOutputProtocol
//        typealias PresenterProtocols = AnyPostsPresenterInputProtocol & AnyGetPostsInteractorOutputProtocol
//        typealias InteractorProtocols = AnyGetPostsInteractorInputProtocol & AnyPostRepositoryOutputProtocol
//
//        let view: ViewProtocols = PostsViewController()
//        var presenter: PresenterProtocols = PostsPresenter()
//        var interactor: InteractorProtocols = GetPostsInteractor()
//        var repository: AnyPostRepositoryInputProtocol = PostRepository()
//        let router: AnyPostsRouterProtocol = PostsRouter()
//
////        MARK: - NetWork
//        let remoteDataSource: AnyPostServiceProtocol = PostService()
//
//        view.presenter = presenter
//        presenter.view = view
//        presenter.getPostsInteractor = interactor
//        presenter.router = router
//        interactor.presenter = presenter
//        interactor.repository = repository
//        repository.interactor = interactor
//        repository.remoteDataSource = remoteDataSource
//
//
//        return view as! PostsViewController
//    }
    
    
}
