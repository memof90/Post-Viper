//
//  Post.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let description: String
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case description = "body"
    }
}
