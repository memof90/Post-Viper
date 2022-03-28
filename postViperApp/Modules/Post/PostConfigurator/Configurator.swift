//
//  Configurator.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation
import UIKit

class HomeAssembly {
    
    static func buildNavigation(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
         
        typealias ViewProtocols = AnyPotsViewProtocol & AnyPostsPresenterOutputProtocol
        typealias PresenterProtocols = AnyPostsPresenterInputProtocol & AnyGetPostsInteractorOutputProtocol
        typealias InteractorProtocols = AnyGetPostsInteractorInputProtocol & AnyPostRepositoryOutputProtocol
        
    //        MARK: - Instace Interactor
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view: ViewProtocols = storyboard.instantiateViewController(withIdentifier: "PostsViewController") as! PostsViewController
        var presenter: PresenterProtocols = PostsPresenter()
        var interactor: InteractorProtocols = GetPostsInteractor()
        var repository: AnyPostRepositoryInputProtocol = PostRepository()
        let router: AnyPostsRouterProtocol = PostsRouter(view: view as! PostsViewController)
        
        //        MARK: - NetWork
        let remoteDataSource: AnyPostServiceProtocol = PostService()
         
        view.presenter = presenter
        presenter.view = view
        presenter.getPostsInteractor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        repository.remoteDataSource = remoteDataSource
         
        return factory(view as! PostsViewController)
     }
    
    func presentDetailPost(posts: Post, navController: UINavigationController?) {
    
    }
}


