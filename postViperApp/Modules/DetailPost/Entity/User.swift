//
//  User.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

struct Users: Codable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let website: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case phone = "phone"
        case website = "website"
    }
    
}
