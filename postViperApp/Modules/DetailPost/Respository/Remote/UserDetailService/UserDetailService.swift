//
//  UserDetailService.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

final class UsersDetailService: BaseService, AnyDetailUsersServiceProtocol {
 
    private enum Constants {
        static let CommentsPath: String = "/users/"
    }
    
    func getUsers(idUser: Int, completion: @escaping DetailUsersCompletion) {
        let finalPath = "\(Path.baseUrl)\(Constants.CommentsPath)\(idUser)"
        sendRequest(url: finalPath, of: Users.self, method: .get, completion: completion)
    }
    
}
