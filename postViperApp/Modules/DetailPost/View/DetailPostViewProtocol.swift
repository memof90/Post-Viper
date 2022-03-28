//
//  DetailPostViewProtocol.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation

protocol AnyDetailPostViewProtocol {
    var presenter: AnyDetailPostPresenterInputProtocol? { get set }
    
}

protocol AnyDetailViewProtocolOutput {
    
    func  didRetrieveDetailPosts()
}
