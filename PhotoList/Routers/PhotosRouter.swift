//
//  PhotosRouter.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation
import UIKit

typealias PhotosListResponse = (_ photos: [Photo]?, _ error: Error?)-> Void

final class PhotosRouter: APIRouter {
    
    @discardableResult
    static func fetchPhotosList(_ completion: @escaping PhotosListResponse) -> URLSessionTask? {
       return performRequest(route: PhotosEndPoint.photos, completion: completion)
    }
    
    @discardableResult
    static func fetchMorePhotos(page: Int, completion: @escaping PhotosListResponse) -> URLSessionTask? {
        return performRequest(route: PhotosEndPoint.morePhotos(page: page), completion: completion)
    }
    
    static func fetchImage(for imageString: String, completion: @escaping ImageResponse) -> URLSessionTask? {
        return performRequestFor(imageString: imageString, completion: completion)
    }
    
}
