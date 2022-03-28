//
//  CommentsDetailServices.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

final class CommentsDetailService: BaseService, AnyDetailCommentsServiceProtocol {
 
    private enum Constants {
        static let CommentsPath: String = "/comments?postId="
    }
    
    func getComments(idPost: Int, idComment: Int, completion: @escaping DetailCommentsCompletion) {
        let finalPath = "\(Path.baseUrl)\(Constants.CommentsPath)\(idComment)"
        sendRequest(url: finalPath, of: [Comments].self, method: .get, completion: completion)
    }
    
}
