//
//  PostServiceProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

typealias PostCompletion = (Result<[Post], CustomError>) -> Void

protocol AnyPostServiceProtocol {
    
    func getPostService(completion: @escaping PostCompletion)
}
