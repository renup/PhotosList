//
//  APIRouter.swift
//  PhotoList
//
//  Created by Renu Punjabi on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation

protocol APIRouter {
   static func performRequest<T: Decodable>(route: APIConfiguration, completion: @escaping ((T?, Error?)-> Void)) -> URLSessionTask?
}

extension APIRouter {
    
    private static func getURL(route: APIConfiguration) -> URL? {
        let path = route.path
        guard var urlComponents = URLComponents(string: path) else { return nil }
        if route.parameters.count >= 1 {
            urlComponents.queryItems = route.parameters
        }
        return urlComponents.url
    }
    
    static func performRequest<T: Decodable>(route: APIConfiguration, completion: @escaping ((T?, Error?)-> Void)) -> URLSessionTask? {
        guard let url = getURL(route: route) else { return nil }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(nil, error)
            } else {
                if let dt = data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: dt)
                        completion(result, nil)
                    } catch(let error) {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
    
}
