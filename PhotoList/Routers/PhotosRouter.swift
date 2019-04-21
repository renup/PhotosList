//
//  PhotosRouter.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation

typealias PhotosListResponse = (_ photos: [Photo]?, _ error: Error?)-> Void

final class PhotosRouter: APIRouter {
    
    @discardableResult
    static func fetchPhotosList(_ completion: @escaping PhotosListResponse) -> URLSessionTask? {
       return performRequest(route: PhotosEndPoint.photos, completion: completion)
    }
}
