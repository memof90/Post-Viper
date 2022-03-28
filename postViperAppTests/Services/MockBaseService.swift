//
//  MockBaseService.swift
//  postViperAppTests
//
//  Created by Memo Figueredo on 28/3/22.
//

import Foundation
@testable import postViperApp

extension BaseService {
    func sendRequestMock<T: Decodable>(url: String, of type: [T].Type, method: HTTPMethod, completion: @escaping (Result<[T], CustomError>) -> Void) {
        if type is [Post].Type {
            let response = generatePopularMoviesResponse()
            completion(.success(response as! [T]))
        }
    }
    
    private func generatePopularMoviesResponse() -> [Post]? {
        let bundle = Bundle(for: MockPostService.self)
        guard let model: [Post] = FileManager.getJSONObject(from: "Post", bundle: bundle) else { return nil }
        return model
    }
}
