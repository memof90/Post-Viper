//
//  HTTPMethod.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        return rawValue
    }
}
