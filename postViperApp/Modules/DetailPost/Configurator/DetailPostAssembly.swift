//
//  DetailPostAssembly.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import UIKit


final class DetailPostAssembly {
    
    static func build(post: Post) -> DetailPostViewController {
        
        typealias ViewProtocols = AnyDetailPostViewProtocol & AnyDetailPostPresenterOutputProtocol
        typealias PresenterProtocols = AnyDetailPostPresenterInputProtocol & AnyGetDetailPostInteractorOutputProtocol
        typealias InteractorProtocols = AnyGetDetailPostInteractorInputProtocol & AnyDetailPostRespositoryOutputProtocol
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var view: ViewProtocols = storyboard.instantiateViewController(withIdentifier: "DetailPostViewController") as! DetailPostViewController
        var presenter: PresenterProtocols = DetailPostPresenter()
        var interactor: InteractorProtocols = GetDetailPostInteractor()
        var repository: AnyDetailPostRespositoryInputProtocol = DetailPostRespository()
        let router: AnyPostsDetailRouterProtocol = PostDetailRouter(view: view as! DetailPostViewController)
        
        let remoteDataSourceComments: AnyDetailCommentsServiceProtocol = CommentsDetailService()
        let remoteDataSourceUsers: AnyDetailUsersServiceProtocol = UsersDetailService()

        view.presenter = presenter
        presenter.view = view
        presenter.getDetailPostInteractor = interactor
        presenter.router = router
        presenter.post = post
        interactor.presenter = presenter
        interactor.repository = repository
        repository.interactor = interactor
        
        repository.remoteDataSourceComments = remoteDataSourceComments
        repository.remoteDataSourceUsers = remoteDataSourceUsers
        
      
        return view as! DetailPostViewController
    }
}
