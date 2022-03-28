//
//  DetailPostViewController.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import UIKit

final class DetailPostViewController: UIViewController, AnyDetailPostViewProtocol {
        
    var presenter: AnyDetailPostPresenterInputProtocol?
    
    var post: Post?
    
    var comments: [Comments] = []
    
    var users: Users? {
        didSet {
            nameLabel.text = users?.name
            emailLabel.text = users?.email
            numberLabel.text = users?.phone
            websiteLabel.text = users?.website
        }
    }
    
//    MARK: IBoutlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!
    
    @IBOutlet weak var commentsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetailPost()
        presenter?.getDetailComment()
        presenter?.getDetailUser()
        configureView()
    }
    
}

extension DetailPostViewController {
    
    func configureView() {
        didRetrieveDetailPost()
        descriptionLabel.text = post?.description
    }
}

extension DetailPostViewController: AnyDetailPostPresenterOutputProtocol {
    
    func didRetrieveDetailPost() {
        hideLoading()
        guard let posts = presenter?.post  else { return}
        self.post = posts
        print(posts)
    }
    
    func didRetrieveDetailComments() {
        guard let comment = presenter?.detailComment else { return }
        self.comments = comment
        print(comment)
    }
    
    func didRetrieveDetailUsers() {
        guard let user = presenter?.detailUser else { return }
        self.users = user
        print(user)
    }
    
    func didGetError(_ error: CustomError) {
        
    }
    
    func endRefresh() {
        
    }
}


