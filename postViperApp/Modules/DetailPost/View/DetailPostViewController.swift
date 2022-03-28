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
    
    @IBOutlet weak var commentsTableView: UITableView! {
        didSet {
            commentsTableView.dataSource = self
            commentsTableView.delegate = self
            commentsTableView.register(CommentsTableViewCell.nib, forCellReuseIdentifier: CommentsTableViewCell.reuseIdentifier)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetailPost()
        presenter?.getDetailComment()
        presenter?.getDetailUser()
        configureView()
    }
    
    //     MARK: - Refresh Data
    private func refreshData() {
        commentsTableView.reloadData()
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
        refreshData()
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


// MARK: - Protocol UITableViewDataSource
extension DetailPostViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureCommentsCell(tableView: tableView, indexPath: indexPath)
    }
    
}


// MARK: - Protocol UITableViewDelegate
extension DetailPostViewController: UITableViewDelegate {
    
    private func configureCommentsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentsTableViewCell.reuseIdentifier, for: indexPath) as? CommentsTableViewCell else { return UITableViewCell() }
            
        cell.emailTextLabel.text = comments[indexPath.row].email
        cell.commentTextLabel.text = comments[indexPath.row].description
            
        
        cell.selectionStyle = .none
        return cell
    }
}
