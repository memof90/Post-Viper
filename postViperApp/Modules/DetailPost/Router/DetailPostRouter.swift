//
//  DetailPostRouter.swift
//  postViperApp
//
//  Created by Memo Figueredo on 26/3/22.
//

import Foundation
import UIKit

class PostDetailRouter: AnyPostsDetailRouterProtocol {
    
    var view: DetailPostViewController
    
    init(view: DetailPostViewController) {
        self.view = view
    }
    
}
