//
//  UserDetailServiceProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

typealias DetailUsersCompletion = (Result<Users, CustomError>) -> Void

protocol AnyDetailUsersServiceProtocol {
    
    func getUsers(idUser: Int, completion: @escaping DetailUsersCompletion)
}
