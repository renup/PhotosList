//
//  PhotosViewModel.swift
//  PhotoList
//
//  Created by Punjabi, Renu on 4/20/19.
//  Copyright © 2019 Punjabi, Renu. All rights reserved.
//

import Foundation

final class PhotosViewModel {
    
    @discardableResult
    static func getPhotosList(_ completion: @escaping PhotosListResponse) -> URLSessionTask? {
       return PhotosRouter.fetchPhotosList { (photos, error) in
            if error != nil {
                completion(nil, error)
            } else {
                guard let picturesArray = photos else {
                    completion(nil, nil)
                    return
                }
                completion(picturesArray, nil)
            }
        }
    }
    
}
