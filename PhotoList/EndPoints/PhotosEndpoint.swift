//
//  PhotosEndpoint.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation

enum PhotosEndPoint: APIConfiguration {
    
    case photos
    case morePhotos(page: Int)
    
    struct Constants {
        static let baseURL = "https://picsum.photos/v2"
        static let list = "/list"
    }
    
    var method: String {
        switch self {
        case .photos, .morePhotos(_):
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .photos:
            return []
        case .morePhotos(let page):
                let pageQueryItem = URLQueryItem(name: "page", value: page.description)
            return [pageQueryItem]
        }
    }
    
    var path: String {
        switch self {
        case .photos, .morePhotos(_):
            return Constants.baseURL + Constants.list
        }
    }
    
    
}
