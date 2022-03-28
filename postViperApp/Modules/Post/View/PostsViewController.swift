//
//  PostsViewController.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import UIKit

final class PostsViewController: UIViewController, AnyPotsViewProtocol {
    
    var presenter: AnyPostsPresenterInputProtocol?
    
    private var postView = PostView()
    
    private var posts: [Post] = []
    
    var isFavorite = [Int: Bool]()
    
    
    //    MARK: - IBoutlet
    
    @IBOutlet weak var selectedPost: UISegmentedControl! {
        didSet {
            selectedPost.backgroundColor = .clear
            selectedPost.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            selectedPost.layer.borderColor = UIColor.systemGreen.cgColor
            selectedPost.layer.borderWidth = 1
            selectedPost.setTitleTextAttributes([.foregroundColor: UIColor.systemGreen], for: .normal)
            selectedPost.selectedSegmentTintColor = UIColor.systemGreen
        }
    }
    
    @IBOutlet weak var postTableView: UITableView! {
        didSet {
            postTableView.dataSource = self
            postTableView.delegate = self
            postTableView.register(PostTableViewCell.nib, forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        }
    }
    
    @IBOutlet weak var DeleteAllButton: UIButton! {
        didSet {
            DeleteAllButton.backgroundColor = .systemRed
            DeleteAllButton.setTitle("Delete All", for: .normal)
            DeleteAllButton.tintColor = UIColor.white
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        presenter?.getPost()
        DispatchQueue.main.async { [weak self] in
            self?.showLoading()
        }
    }
    
    private func configureView() {
        postView.delegate = self
    }
    
    //     MARK: - Refresh Data
    private func refreshData() {
        postTableView.reloadData()
    }
    
    //     MARK: - IbAction
    @IBAction func didSelectedBtn(_ sender: UISegmentedControl) {
        switch selectedPost.selectedSegmentIndex {
        case 0:
            print("All")
        case 1:
            print("Favorites")
        default:
            print("Error")
        }
        refreshData()
    }
    
    @IBAction func didDeletedAll(_ sender: UIButton) {
        didDeletePosts()
    }
    
    @IBAction func didRefreshData(_ sender: UIBarButtonItem) {
        didRetrievePosts()
        hideLoading()
    }
    
}


// MARK: - LoadingData to Presenter

extension PostsViewController: AnyPostsPresenterOutputProtocol {
    
    func didRetrievePosts() {
        hideLoading()
        guard let posts = presenter?.posts else { return }
            self.posts = posts
            self.refreshData()
    }
    
    func didDeletePosts() {
        posts.removeAll()
        refreshData()
    }
    
    func didGetError(_ message: String) {
        hideLoading()
        postView.setErrorScreen(message: message, tableView: postTableView)
    }
    
    func endRefresh() {
        postView.endRefresh()
    }
}


// MARK: - Delegate to show View detail
extension PostsViewController: AnyPostsViewDelegate {
    func showDetail(of post: Post) {
        presenter?.goToDetail(post: post, view: self.navigationController)
    }
    
    func refresh() {
        presenter?.getPost()
    }
}


// MARK: - Protocol UITableViewDataSource

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedNumberOfRows(segmentedControl: selectedPost, tableView: tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return selectedCell(segmentedControl: selectedPost, tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        cell.CircleImageView.isHidden = true
        showDetail(of: posts[indexPath.row])
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        ActionItemAt(tableView: tableView, rowIndexPathAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favoriteAction = UIContextualAction(style: .destructive, title: "") { action, sourceView, completionHandler in
            
            let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
            
            cell.favoriteImageView.isHidden = self.posts[indexPath.row].isFavorite
            self.posts[indexPath.row].isFavorite = self.posts[indexPath.row].isFavorite ? false : true
            
            tableView.deselectRow(at: indexPath, animated: false)
            
            completionHandler(true)
        }
        
        favoriteAction.backgroundColor = .systemYellow
        favoriteAction.image = self.posts[indexPath.row].isFavorite ? UIImage(systemName: "heart.slash.fill") : UIImage(systemName: "heart.fill")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
        return swipeConfiguration
    }
}

// MARK: - Protocol UITableViewDelegate

extension PostsViewController: UITableViewDelegate {
    
    private func configurePostsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        if isFavorite[indexPath.row] == true {
            cell.TitleText.text = posts[indexPath.row].title
            cell.favoriteImageView.isHidden = posts[indexPath.row].isFavorite ? false: true
        } else {
            cell.TitleText.text = posts[indexPath.row].title
            cell.favoriteImageView.isHidden = posts[indexPath.row].isFavorite ? false: true
            cell.CircleImageView.isHidden = false
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    private func configureFavoritesCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        if isFavorite[indexPath.row] == true {
            cell.TitleText.text = posts[indexPath.row].description
            cell.favoriteImageView.isHidden = posts[indexPath.row].isFavorite ? false: true
        } else {
            cell.TitleText.text = posts[indexPath.row].description
            cell.favoriteImageView.isHidden = posts[indexPath.row].isFavorite ? false: true
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func selectedCell(segmentedControl: UISegmentedControl,
                      tableView: UITableView,
                      indexPath: IndexPath) -> UITableViewCell {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            return configurePostsCell(tableView: tableView, indexPath: indexPath)
        case 1:
            return configureFavoritesCell(tableView: tableView, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func selectedNumberOfRows(segmentedControl: UISegmentedControl,
                              tableView: UITableView,
                              numberOfRowsInSection section: Int) -> Int {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            return posts.count
        case 1:
            return posts.count
        default:
           return 0
        }
    }
    
    private func ActionItemAt(tableView: UITableView, rowIndexPathAt indexPath: IndexPath) -> UISwipeActionsConfiguration {
            
        let deleteAction = UIContextualAction(style: .destructive, title: "") { [weak self] action, sourceView, completionHandler in
            
            self?.posts.remove(at: indexPath.row)
            
            self?.refreshData()
            
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        let favoriteAction = UIContextualAction(style: .destructive, title: "") { action, sourceView, completionHandler in
            
            let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
            
            cell.favoriteImageView.isHidden = self.posts[indexPath.row].isFavorite
            self.posts[indexPath.row].isFavorite = self.posts[indexPath.row].isFavorite ? false : true
            
            tableView.deselectRow(at: indexPath, animated: false)
            
            completionHandler(true)
        }
        
        favoriteAction.backgroundColor = .systemYellow
        favoriteAction.image = self.posts[indexPath.row].isFavorite ? UIImage(systemName: "heart.slash.fill") : UIImage(systemName: "heart.fill")

        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, favoriteAction])
        return swipeConfiguration
    }
    
}
