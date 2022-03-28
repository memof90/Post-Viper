//
//  Commets.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

struct Comments: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case description = "body"
    }
    
}
