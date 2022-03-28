//
//  PostView.swift
//  postViperApp
//
//  Created by Memo Figueredo on 25/3/22.
//

import UIKit

final class PostView: UIView {
    
    weak var delegate: AnyPostsViewDelegate?
    
    //    MARK: - Refresh Control to realod tableView and TableView
    
    public lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        refreshControl.tintColor = .systemGreen
        return refreshControl
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.addSubview(refreshControl)
        return tableView
    }()
    //    MARK: DataSource to CollectionViewProtocols
        private lazy var datasource: PostDataSource = {
            let dataSource = PostDataSource()
            tableView.dataSource = dataSource
            tableView.delegate = dataSource
            return dataSource
        }()
    
    //     MARK: - OnRefresh pass to PostViewController
    @objc func onRefresh() {
        delegate?.refresh()
    }
    
    func endRefresh() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
    
    private func refreshData() {
        tableView.reloadData()
    }
    
    func configure(posts: [Post], delegate: AnyPostsViewDelegate) {
        datasource.configure(posts: posts, delegate: delegate)
        refreshData()
    }
    
    //    MARK: - Put error into screen of the user
    func setErrorScreen(message: String, tableView: UITableView) {
        tableView.setEmptyMessage(message)
    }
}
