//
//  NavigationBuilder.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    static func build(rootView: UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootView)
                
                let font = UIFont.systemFont(ofSize: 20)
                
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: font,
                    .foregroundColor: UIColor.white,
                ]
                navigationController.navigationBar.titleTextAttributes = attributes
                navigationController.navigationBar.largeTitleTextAttributes = attributes
                navigationController.navigationBar.prefersLargeTitles = false
                
                
                
                let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor.systemGreen
                appearance.titleTextAttributes = attributes
                appearance.largeTitleTextAttributes = attributes
                navigationController.navigationBar.standardAppearance = appearance;
                navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
        
        return navigationController
    }
}
