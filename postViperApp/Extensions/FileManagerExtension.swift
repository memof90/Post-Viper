//
//  FileManagerExtension.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

// MARK: - Extension to Read Files json to stubs

extension FileManager {
    
    static func getJSONObject<T: Decodable> (from fileName: String, bundle: Bundle) -> T? {
        guard let url: URL = bundle.url(forResource: fileName, withExtension: "json"),
              let data : Data = try? Data(contentsOf: url) else {
                  return nil
              }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
