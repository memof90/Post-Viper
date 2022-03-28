//
//  BaseService.swift
//  postViperApp
//
//  Created by Memo Figueredo on 24/3/22.
//

import Foundation

//MARK: - Services base


protocol BaseService {
    func sendRequest<T: Codable>(url: String, of: [T].Type, method: HTTPMethod, completion: @escaping (Result<[T], CustomError>) -> Void)
    func sendRequest<T: Codable>(url: String, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void)
}


extension BaseService {
    func sendRequest<T: Codable>(url: String, of: [T].Type, method: HTTPMethod, completion: @escaping (Result<[T], CustomError>) -> Void) {
//        MARK: - resolve Url with the value present bad URL Request this is URL
        guard let url = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
//        MARK: - Request of the url
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        
        let session = URLSession(configuration: .default)
        
        let task =  session.dataTask(with: request) { data, response, error in
//            MARK: - In case of response failde to status code 200 or nothing internet conection failed
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.noInternetConnection))
                return
            }
            
//            MARK: - In the case data nothing work or failed
            guard let data = data else {
                completion(.failure(.responseError))
                return
            }
            
//            MARK: - Decode data to pass to model to presenter in the view
            do {
                let response = try JSONDecoder().decode([T].self, from: data)
                completion(.success(response))
                
            } catch {
                completion(.failure(.unableToParse))
            }
            
        }
        task.resume()
    }
    
    func sendRequest<T: Codable>(url: String, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
//        MARK: - resolve Url with the value present bad URL Request this is URL
        guard let url = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
//        MARK: - Request of the url
        var request = URLRequest(url: url)
        request.httpMethod = method.name
        
        let session = URLSession(configuration: .default)
        
        let task =  session.dataTask(with: request) { data, response, error in
//            MARK: - In case of response failde to status code 200 or nothing internet conection failed
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.noInternetConnection))
                return
            }
            
//            MARK: - In the case data nothing work or failed
            guard let data = data else {
                completion(.failure(.responseError))
                return
            }
            
//            MARK: - Decode data to pass to model to presenter in the view
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
                
            } catch {
                completion(.failure(.unableToParse))
            }
            
        }
        task.resume()
    }
}

