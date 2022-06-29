//
//  PostService.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

final class PostService: BaseService, AnyPostServiceProtocol {
    
    private enum Constants {
        static let postPath: String = "/posts"
    }
    
    func getPostService(completion: @escaping PostCompletion) {
        let finalPath = "\(Path.baseUrl)\(Constants.postPath)"
        sendRequest(url: finalPath, of: [Post].self, method: .get, completion: completion)
    }
}
