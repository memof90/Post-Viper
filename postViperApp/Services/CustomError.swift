//
//  CustomError.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

enum CustomError: Error {
    case badUrl
    case responseError
    case unableToParse
    case noInternetConnection
}
