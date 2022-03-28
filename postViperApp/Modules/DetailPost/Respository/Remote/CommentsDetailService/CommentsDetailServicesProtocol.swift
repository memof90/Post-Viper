//
//  CommentsDetailServicesProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

typealias DetailCommentsCompletion = (Result<[Comments], CustomError>) -> Void

protocol AnyDetailCommentsServiceProtocol {
    
    func getComments(idPost: Int, idComment: Int, completion: @escaping DetailCommentsCompletion)
}
