//
//  PostDataSource.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//    postView.tableView = postTableView
//postView.configure(posts: posts, delegate: self)

import UIKit

final class PostDataSource: NSObject {
    
    private var posts: [Post] = []
    
    var isFavorite = [Int: Bool]()
    

    
    weak var delegate: AnyPostsViewDelegate?
    
    override init() {}
    
    func configure(posts: [Post], delegate: AnyPostsViewDelegate) {
        self.posts = posts
        self.delegate = delegate
    }
}

extension PostDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return configurePostsCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        cell.CircleImageView.image = UIImage(systemName: "star.fill")
        cell.CircleImageView.tintColor = .systemYellow
        isFavorite[indexPath.row] = true
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        cell.CircleImageView.image = UIImage(systemName: "circlebadge.fill")
        cell.CircleImageView.tintColor = .link
        isFavorite[indexPath.row] = false
    }
    
    private func configurePostsCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        if isFavorite[indexPath.row] == true {
            cell.CircleImageView.image = UIImage(systemName: "star.fill")
            cell.CircleImageView.tintColor = .systemYellow
            cell.TitleText.text = posts[indexPath.row].title
        } else {
            cell.CircleImageView.image = UIImage(systemName: "circlebadge.fill")
            cell.CircleImageView.tintColor = .link
            cell.TitleText.text = posts[indexPath.row].title
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension PostDataSource: UITableViewDelegate {
    
}

extension PostDataSource {
    
    func configureFavorite()  {
        for i in 0...posts.count {
            isFavorite[i] = false
        }
    }
}
